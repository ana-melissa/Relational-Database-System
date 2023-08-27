/* WrongWasDefeated uses
FullBattlePointsView and (possibly) some tables. In addition to the WrongWasDefeated query, you must also
include some comments in the queryview.sql script; we’ll describe those necessary comments below */

/* A character in a battle lost that battle if the monsterBattlePoints for the monster in that battle is greater than the
characterBattlePoints for that character. Write and run a SQL query which finds the characters that are in
FullBattlePointsView who 
    a) lost at least one battle to a monster
    b) whose wasDefeated value is FALSE.
(Don’t consider the characters who aren’t in FullBattlePointsView.)*/

--Battles(characterMemberID, characterRole, characterBattlePoints, monsterID, monsterBattlePoints)
-- Characters(memberID, role, name, roomID, currentMoney, wasDefeated)

SELECT c.memberID AS theMemberID, c.role AS theRole, c.name AS theName, f.fullBattlePoints AS theFullBattlePoints, COUNT(*) AS numLosses
FROM FullBattlePointsView f, Characters c, Battles b
WHERE c.memberID = f.memberID
AND c.memberID = b.characterMemberID
AND c.role = f.role
AND c.role = b.characterRole
AND c.name = f.name
AND b.monsterBattlePoints > b.characterBattlePoints
AND c.wasDefeated = FALSE
AND f.name IS NOT NULL

GROUP BY c.memberID, c.role, c.name, f.fullBattlePoints
HAVING COUNT(*) >= 3;


/* output of query first run
amelissa=> \i queryview.sql

 thememberid | therole | thename  | thefullbattlepoints | numlosses 
-------------+---------+----------+---------------------+-----------
         101 | knight  | Lancelot |                  56 |         4
         101 | mage    | Jack     |                 137 |         5
         111 | cleric  | Patrick  |                 215 |         3
(3 rows)

DELETE 1
DELETE 1
*/

DELETE FROM Battles WHERE characterMemberID = 111 AND characterRole = 'cleric' AND monsterID = 925;

DELETE FROM Battles WHERE characterMemberID = 101 AND characterRole = 'knight' AND monsterID = 944;


/* output of query second run

 thememberid | therole | thename  | thefullbattlepoints | numlosses 
-------------+---------+----------+---------------------+-----------
         101 | knight  | Lancelot |                  56 |         3
         101 | mage    | Jack     |                 137 |         5
(2 rows)

DELETE 0
DELETE 0

*/
