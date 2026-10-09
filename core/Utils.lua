local Utils = {}


---@param obj1 table first rectangle
---@param obj2 table second rectangle
---@return boolean True if the two rectangles overlap
function Utils.Collide(obj1, obj2)
    return
        obj1.x < obj2.x + obj2.width
        and obj1.x + obj1.width > obj2.x
        and obj1.y < obj2.y + obj2.height
        and obj1.y + obj1.height > obj2.y
end

return Utils
