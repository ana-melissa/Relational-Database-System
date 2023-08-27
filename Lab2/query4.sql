-- Query 4

-- A monster is a basilisk if its monsterKind is ‘ba’. 
-- A character is a knight if its role is ‘knight’. Find all the
-- battles in which:
    -- the monster is a basilisk,
    -- the character is not a knight
    -- the member associated with the character has 
        --an expiration date that is on or after December 10,
        -- 2022, and
    -- the current money that the character has is more 
        -- than the initial money associated with that
        -- character’s role


-- The attributes which should appear in your 
-- result are the name of the monster in the 
-- battle, the name of the character in the battle, 
-- and the role of that character. These attributes
-- should appear in your result as
-- theMonster, theCharacter and theRole.

-- No duplicates should appear in your result.

--\i create_lab2.sql
--\i load_lab2.sql

-- Battles(characterMemberID, characterRole, characterBattlePoints, monsterID, monsterBattlePoints)
-- Monsters(monsterID, monsterKind, name, battlePoints, roomID, wasDefeated)
-- Characters(memberID, role, name, roomID, currentMoney, wasDefeated)
-- Members(memberID, name, address, joinDate, expirationDate, isCurrent)  
-- Roles(role, battlePoints, InitialMoney)

-- find all the battles in which the monster is a basilik
-- find all battesl in which the monster is a basilik and the character is not a knight
-- the member associated with the character has an expiration date that is on or after December 10, 2022
-- the current money that the character has is more than the initial money associated with that character’s role

SELECT m.name AS theMonster, c.name AS theCharacter, b.characterRole AS theRole
FROM Battles b, Monsters m, Characters c
WHERE b.characterMemberID = c.memberID
    AND m.monsterID = b.monsterID
    AND m.monsterKind = 'ba'
    AND b.characterRole <> 'knight'
    AND c.role <> 'knight'
    AND b.characterMemberID IN (SELECT e.memberID
        FROM Members e
        WHERE e.expirationDate > '2022-12-9'
        AND c.role IN (SELECT r.role
            FROM Roles r
            WHERE c.currentMoney > r.initialMoney)
        )
