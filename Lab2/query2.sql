-- Query 2

-- Find every monster whose wasDefeated value is
-- FALSE, but who was in a battle in which their
-- monsterBattlePoints was less than the 
-- characterBattlePoints of the character they 
-- fought in that battle. The attribute in your 
-- result should be the name of the monster, 
-- which should appear as monsterName.

-- No duplicates should appear in your result

SELECT DISTINCT m.name AS monsterName

FROM Monsters m, Battles B

WHERE m.wasDefeated = FALSE
    --WHERE b.monsterBattlePoints < b.characterBattlePoints

AND m.BattlePoints < b.characterBattlePoints
;