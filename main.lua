local tours = 0; local select = {};
for valueTwo = 1, 3 do select[valueTwo] = {" ", " ", " "} end

-- Functions
function winnerchecker()
local turn = turnchecker()
for valueTwo = 1, 3 do if turn == select[valueTwo][1] and select[valueTwo][1] == select[valueTwo][2] and select[valueTwo][2] == select[valueTwo][3] then return true end
end
for valueOne = 1, 3 do if turn == select[1][valueOne] and select[1][valueOne] == select[2][valueOne] and select[2][valueOne] == select[3][valueOne] then return true end
end
if turn == select[1][1] and select[1][1] == select[2][2] and select[2][2] == select[3][3] then
return select[1][1]
elseif turn == select[1][3] and select[1][3] == select[2][2] and select[2][2] == select[3][1] then
return true end end

function drawchecker()
if not os.execute("clear") then os.execute("cls")
elseif not os.execute("cls") then os.execute("clear") else
for i = 1,20 do print("\n\n") end end
print("\n\t    1)   2)   3)\n")
for i = 1, 3 do print("\t" .. i .. ")   " .. select[i][1] .. " | " .. select[i][2] .. "  | " .. select[i][3])
if i < 3 then print("\t   ----#----#----") end end end

function turnchecker() if tours % 2 == 0 then return "O" else return "X" end end

-- Game Handler
while true do
drawchecker()
local playerview;
if turnchecker() == "O" then playerview = "Player 1 [ O ]" else playerview = "Player 2 [ X ]" end
print("\n> It's " .. playerview .. " Turn! Type a Coordinate;")
local valueOne, valueTwo = io.read("*n", "*n")
if valueOne and valueTwo and valueOne > 0 and valueTwo > 0 and valueOne < 4 and valueTwo < 4 and select[valueTwo][valueOne] == " " then
select[valueTwo][valueOne] = turnchecker()
if tours > 3 and winnerchecker() then drawchecker() print(turnchecker() .. " Won!") break end
tours = tours + 1
if (tours == 9) then drawchecker() print("it's a Draw!") break end
end
end

