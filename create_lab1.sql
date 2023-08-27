-- Ana Melissa --

-- CREATE SCHEMA Lab1; --
-- DROP SCHEMA lab1 CASCADE; --

CREATE TABLE Members (
    memberID        INT PRIMARY KEY,
    name            VARCHAR(50),
    address         VARCHAR(50),
    joinDate        DATE,
    expirationDate  DATE,
    isCurrent       BOOLEAN
);

CREATE TABLE Rooms (
    roomID          INT PRIMARY KEY,
    roomDescription VARCHAR(30),
    -- any value that appears in northNext eastNext, southNext
    -- or westNext in a Rooms row must appear as the roomID of 
    -- a row in Rooms
    northNext  INT,
    eastNext   INT,
    southNext  INT,
    westNext   INT,
    FOREIGN KEY (northNext) REFERENCES Rooms(RoomID),
    FOREIGN KEY (eastNext) REFERENCES Rooms(RoomID),
    FOREIGN KEY (southNext) REFERENCES Rooms(RoomID),
    FOREIGN KEY (westNext) REFERENCES Rooms(RoomID)
);

CREATE TABLE Roles (
    role            VARCHAR(50) PRIMARY KEY,
    battlePoints    INT,
    initialMoney    NUMERIC(5,2)
);

CREATE TABLE Characters (
    memberID        INT,
    role            VARCHAR(50),
    name            VARCHAR(50),
    roomID          INT,
    currentMoney    NUMERIC(5, 2),
    wasDefeated     BOOLEAN,
    PRIMARY KEY (memberID, role),

    -- Any memberID that’s in a Characters row must appear 
    -- as a memberID of a row in the Members table.
    FOREIGN KEY (memberID) REFERENCES Members(memberID),

    -- Any role that’s in a Characters row must appear 
    -- as a role in a row in the Roles table.
    FOREIGN KEY (role) REFERENCES Roles(role),

    -- Any roomID that’s in a Characters row must appear 
    -- as a roomID of a row in the Rooms table.
    FOREIGN KEY (roomID) REFERENCES Rooms(roomID)
);

CREATE TABLE Things (
    thingID             INT PRIMARY KEY,
    thingKind           CHAR(2),
    initialRoomID       INT,
    ownerMemberID       INT,
    ownerRole           VARCHAR(6),
    cost                NUMERIC(4, 2),
    extraBattlePoints   INT,

    -- Any initialRoomID that’s in a Things row 
    -- must appear as a roomID of a row in the Rooms table.
    FOREIGN KEY (initialRoomID) REFERENCES Rooms(roomID),

    -- Any (ownerMemberID, ownerRole) that’s in a Things 
    -- row must appear as a (memberID, role) of a row in 
    -- the Characters table. 
    FOREIGN KEY (ownerMemberID, ownerRole) REFERENCES Characters(memberID, role)
);

CREATE TABLE Monsters (
    monsterID           INT PRIMARY KEY,
    monsterKind         CHAR(2),
    name                VARCHAR(50),
    battlePoints        INT,
    roomID              INT,
    wasDefeated         BOOLEAN,
    FOREIGN KEY (roomID) REFERENCES Rooms(roomID)
);

CREATE TABLE Battles (
    characterMemberID       INT,
    characterRole           VARCHAR(6),
    characterBattlePoints   INT,
    monsterID               INT,
    monsterBattlePoints     INT,
    PRIMARY KEY (characterMemberID, characterRole, monsterID),
    FOREIGN KEY (characterMemberID, characterRole) REFERENCES Characters(memberID, role),
    FOREIGN KEY (monsterID) REFERENCES Monsters(monsterID)
);
