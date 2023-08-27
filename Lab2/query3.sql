-- Query 3

-- A member may have more than one character, 
-- as long as those character roles are different. 
-- Some characters may own things; some characters 
-- may not own any things.

-- Find the name and joinDate of every member 
-- whose joinDate isn’t NULL and who has no 
-- character that owns a thing. (Yes, a member 
-- who has no characters should appear in your 
-- answer.) The attributes in your result should 
-- appear as memberName and memberJoinDate.

-- No duplicates should appear in your result.

-- this query is getting all the currentmembers 
-- who have a character, and that character 
-- doesn't own any things

--\i create_lab2.sql
--\i load_lab2.sql
-- Members(memberID, name, address, joinDate, expirationDate, isCurrent)
-- Characters(memberID, role, name, roomID, currentMoney, wasDefeated)
-- Things(thingID, thingKind, initialRoomID, ownerMemberID, ownerRole, cost, extraBattlePoints)

SELECT m.name AS memberName, m.joinDate AS memberJoinDate
FROM Members m
-- if there are characters that exists, select them if they dont have things and if the member isnt null
WHERE m.joinDate IS NOT NULL 
AND m.memberID NOT IN (SELECT c.memberID
    FROM Characters c, Things t

    WHERE c.memberID = t.ownerMemberID
)