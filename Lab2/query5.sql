-- We'll say that two rooms are east-west adjacent 
-- if the first is east of the second, and the second 
-- is west of the first. That is, the first room is 
-- the eastRoom of the second, and the second Room is 
-- the westRoom of the first. (Room directions in 
-- Adventure might not be logical; even though the 
-- first is east of the second, the second might 
-- not be west of the first.)

-- Find each pair of rooms that are east-west adjacent, 
-- output the roomID of the first, the room description
-- of the first, the roomID of the second and the room
--  description of the second. The attributes in your
-- result should appear as eastRoomID, eastRoomDescription,
--  westRoomID and westRoomDescription.

-- No duplicates should appear in your result

--\i create_lab2.sql
--\i load_lab2.sql

SELECT r.eastNext AS eastRoomID, 
    o.roomDescription AS eastRoomDescription,
    o.westNext AS westRoomID, 
    r.roomDescription AS westRoomDecsription

FROM Rooms r, Rooms o

WHERE o.westNext = r.roomID
    AND r.eastNext = o.roomID
