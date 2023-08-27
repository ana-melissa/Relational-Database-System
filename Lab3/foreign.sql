/* Each monsterID in the Battles table must appear in the Monsters table as a Primary Key (monsterID).
If a tuple in the Monsters table is deleted, and there are Battles tuples that correspond to that monster,
then that Monsters tuple deletion should be rejected . If the Primary Key monsterID of a Monsters
tuple is updated, then all battles in Battles involving that monster should also be updated to the new
monsterID value . */

ALTER TABLE Battles
ADD CONSTRAINT FK_monsterID
FOREIGN KEY (MonsterID)
REFERENCES Monsters(monsterID) 
ON DELETE RESTRICT
ON UPDATE CASCADE;
--ON UPDATE set Monster(monsterID);



/* Each character (characterMemberID, characterRole) that appears in the Battles table must also appear
in the Characters table as a Primary Key (memberID, role). If a tuple in the Characters table is deleted,
then all Battles tuples involving that character should also be deleted. If the Primary Key (memberID,
role) of a Characters tuple is updated and there are Battles tuples that correspond to that character, then
the update of the Characters tuple should be rejected */

ALTER TABLE Battles
ADD CONSTRAINT FK_MemberID_Role
FOREIGN KEY (characterMemberID, characterRole)
REFERENCES Characters(memberID, role) 
ON DELETE CASCADE
ON UPDATE RESTRICT;

/*Each character (ownerMemberID, ownerRole) that appears in the Things table as an owner of a thing
must also appear in the Characters table as a Primary Key (memberID, role). If a tuple in the
Characters table is deleted, then all Things tuples that that Character should have both
ownerMemberID and ownerRole set to NULL. If the Primary Key (memberID, role) of a Characters
tuple is updated, then all tuples in Things that are owned by that character should be updated to the
new (memberID, role) owner value */

ALTER TABLE Things
ADD CONSTRAINT FK_ownerMemberID_ownerRole
FOREIGN KEY (ownerMemberID, ownerRole)
REFERENCES Characters(memberID, role) 
ON DELETE SET NULL
ON UPDATE CASCADE;