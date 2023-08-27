/* 1. In Things, cost must be positive. (As I hope all of you know, zero is not positive.) This constraint should be
named positiveCost. */
ALTER TABLE Things
ADD CONSTRAINT positiveCost
CHECK (cost > 0);


/* 2. In Monsters, if battlePoints is greater or equal to 40, then the monsterKind must represent a giant or a basilisk
or be NULL. (A giant has monsterKind ‘gi’, and a basilisk has monsterKind ‘ba’.) This must be handled by a
single constraint. Please give a name to this constraint when you create it. This constraint should be named
majorMonsters. */
ALTER TABLE Monsters
ADD CONSTRAINT majorMonsters
CHECK (CASE WHEN battlePoints >= 40 THEN (monsterKind = 'gi') OR (monsterKind = 'ba') OR (monsterKind IS NULL)
        END );

/* 3. In Members, if expirationDate is NULL then isCurrent must also be NULL. This constraint should be named
expirationCurrrent. */
ALTER TABLE Members
ADD CONSTRAINT expirationCurrrent
CHECK (CASE WHEN expirationDate IS NULL THEN isCurrent IS NULL END);

/* Write commands to add general constraints in the order the constraints are described above, and save your
commands to the file general.sql. Note that the values TRUE and UNKNOWN are okay for a Check constraint
is okay, but FALSE isn’t. */