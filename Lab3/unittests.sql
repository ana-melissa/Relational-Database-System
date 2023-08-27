/*For each of the 3 foreign key constraints specified in section 2.3, write one unit test:
    An INSERT command that violates the foreign key constraint (and elicits an error). You must violate
    that specific foreign key constraint, not any other constraint.*/


INSERT INTO Battles (characterMemberID, characterRole, characterBattlePoints, monsterID, monsterBattlePoints)
VALUES (809, 'gi', 5, 999, 3);

INSERT INTO Battles (characterMemberID, characterRole, characterBattlePoints, monsterID, monsterBattlePoints)
VALUES (800, 'hi', 6, 886, 3);

INSERT INTO Things (thingID, thingKind, initialRoomID, ownerMemberID, ownerRole, cost, extraBattlePoints)
VALUES (6018, 'sc', 3, 879, 'knight', 8.65, 9);

/*
Also, for each of the 3 general constraints, write 2 unit tests, with 2 tests for the first general constraint,
followed by 2 tests for the second general constraint, followed by 2 tests for the third general constraint.
    An UPDATE command that meets the constraint.
    An UPDATE command that violates the constraint (and elicits an error).
Save these 3 + 6 = 9 unit tests in the order specified above in the file unittests.sql.*/

UPDATE Things
SET cost = 8.23
WHERE thingID = 6002;

UPDATE Things
SET cost = -8.23
WHERE thingID = 6002;

-------------------------------------------

UPDATE Monsters
SET battlePoints = 50, monsterKind = 'gi'
WHERE monsterID = 944;

UPDATE Monsters
SET battlePoints = 50, monsterKind = 'ga'
WHERE monsterID = 944;

--------------------------------------------

UPDATE Members
SET expirationDate = NULL, isCurrent = NULL
WHERE memberID = 101;

UPDATE Members
SET expirationDate = NULL, isCurrent = TRUE
WHERE memberID = 101;
