/* There two ways that we could determine whether or not a character (or monster) has been defeated. One way is
by looking at the wasDefeated attribute of a characters (or monster). Another way is by looking at the battles
involving that character (or monster). */

/* The number of points that a monster would have in a battle is the battlePoints for that monster. But the full
battle points that a character would have in a battle equals the battlePoints for that character’s role plus the
number of extraBattlePoints for all the things which that character owns. */

/* Create a view called FullBattlePointsView which for each character gives the full battle points which that
character would have in a future battle. The attributes in your view should appear as memberID, role, name and
fullBattlePoints. But only include a character in FullBattlesPoints View if that character owns at least one
thing.*/

\i create_lab3.sql
\i load_lab3.sql


CREATE VIEW FullBattlePointsView AS
SELECT c.memberID, c.role, c.name, SUM(t.extraBattlePoints) + r.battlePoints AS fullBattlePoints
FROM Characters c, Things t, Roles r
WHERE c.memberID = t.ownerMemberID
AND c.role = r.role
AND c.role = t.ownerRole

GROUP BY c.memberID, c.role, c.name, r.battlePoints;

--TABLE FullBattlePointsView;
