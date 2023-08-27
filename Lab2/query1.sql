-- Query 1

-- A thing is a scroll if its thingKind is ‘sc’. 
-- Find all the rooms and scrolls where the room 
-- is the scroll’s initial room (initialRoomID), 
-- that initial room’s description has the lowercase 
-- letter ‘w’ in its second position, and the cost 
-- of the scroll is less than 12. The attributes in 
-- your result should be roomID, initialRoomDescription,
-- thingID and cost.

-- The tuples in your result should appear in 
-- alphabetical order based on room description. 
-- Two result tuples that have the same room 
-- description should appear in decreasing order 
-- of cost. 

-- No duplicates should appear in your result.

-- The attributes in your result should be roomID, 
-- initialRoomDescription, thingID and cost.
SELECT r.roomID, r.roomDescription AS initialRoomDescription, t.thingID, t.cost

FROM Rooms r, Things t

-- A thing is a scroll if its thingKind is ‘sc’
WHERE t.thingKind = 'sc'

AND r.roomID = t.initialRoomID
    -- that initial room’s description has the lowercase 
    -- letter ‘w’ in its second position
AND r.roomDescription LIKE '_w%'
    -- and the cost of the scroll is less than 12
AND t.cost < 12

-- alphabetical order based on room description. 
ORDER BY t.cost DESC
;
