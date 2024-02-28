local f1name = "ShowA.bin"
local f2name = "ShowB.bin"

--try:
--luac54 -o main.L main.lua | lua54 main.L

function BiggerFile(f1name, f2name)
    local file1 = io.open(f1name, "rb")
    local file2 = io.open(f2name, "rb")
    if file1 and file2 then
        local size1 = file1:seek("end")
        local size2 = file2:seek("end")

        local result
        if size1 > size2 then
            result = f1name.." bigger!"
        elseif size1 < size2 then
            result = f2name.." bigger!"
        else
            result = "bytes same"
        end
        file1:close()
        file2:close()
        return result
    else
        return "null"
    end
end

local file1 = io.open(f1name, "rb")
local file2 = io.open(f2name, "rb")

if file1 and file2 then
    -- 逐字节读取文件并输出
    local byte1
    local byte2
    local byte1HEX
    local byte2HEX
    local index = 0
    local indexHEX

    local BF = BiggerFile(f1name, f2name)
    if BF ~= "bytes same" then
        print("watch out, the size of the files you provide is not the same")
        print("continue? (y/n)")
        local intent = io.read()
        if intent ~= "y" then
            return
        end
    end

    local outFile = io.open("T("..os.time()..") F("..f1name.." "..f2name..").txt", "w")
    outFile:write(BF.."\n")

    outFile:write("out format:{(the location of the different bytes) (file 1 byte) (file 2 byte)}\n")
    outFile:write("bytes different list {\n")
    repeat
        byte1 = file1:read(1)
        byte2 = file2:read(1)
        if byte1 and byte2 then
            if not (byte1 == byte2) then
                indexHEX = string.format("%08X", index)
                byte1HEX = string.byte(byte1, 1)
                byte2HEX = string.byte(byte2, 1)
                byte1HEX = string.format("%02X", byte1HEX)
                byte2HEX = string.format("%02X", byte2HEX)
                outFile:write(("%s %s %s\n"):format(indexHEX, byte1HEX, byte2HEX))
                
            end
            index = index + 1
        end
    until (not byte1) and (not byte2)
    outFile:write("}".."\n")

    -- 关闭文件
    outFile:close()
    file1:close()
    file2:close()
else
    print("无法打开文件")
end