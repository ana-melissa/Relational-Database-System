/* Write a file, combine.sql (which should have multiple SQL statements that are in a Serializable transaction)
that will do the following. For each tuple in ModifyMembers, there might already be a tuple in the Members
table that has the same primary key (that is, the same value for memberID). If there isn’t a tuple in Members
with the same primary key, then this is a new member who should be inserted into Members. If there already is
a tuple in Members with that primary key, then this is an update of information about that member. So here are
the effects that your transaction should have: */


/* If there isn’t already a tuple in the Members table which has that memberID, then you should insert a tuple
into the Members table corresponding to all the attribute values in that ModifyMembers tuple. Your insert
should also set joinDate to today’s date (we explain how below), and isCurrent to NULL. */

/* If there already is a tuple in the Members table which has that memberID, then update the tuple in
Members that has that memberID. Update name, address and expirationDate for that existing Members
tuple to equal the corresponding attribute values in the ModifyMembers tuple. Also, make the value of the
isCurrent to TRUE. Don’t modify the joinDate value which is in the existing Members tuple */


\i create_lab3.sql
\i load_lab3.sql


-- if the primary keys do match - update
UPDATE Members m
SET name = mm.name, address = mm.address, expirationDate = mm.expirationDate, isCurrent = TRUE
FROM ModifyMembers mm
WHERE m.memberID = mm.memberID;

-- if the primary keys dont match - insert
INSERT INTO Members (memberID, name, address, joinDate, expirationDate, isCurrent)
SELECT m.memberID, m.name, m.address, CURRENT_DATE, m.expirationDate, NULL
FROM ModifyMembers m
WHERE m.memberID NOT IN
    (SELECT b.memberID
    FROM Members b);

/*
SELECT MemberID, name, address, joinDate, expirationDate, isCurrent
FROM Members;

SELECT memberID, name, address, expirationDate
FROM ModifyMembers;
*/