local ffi = require "ffi"

local murmer = ffi.load("murmer.so.1")

ffi.cdef [[
uint32_t PMurHash32(uint32_t seed, const void *key, int len);
]]

local char = ffi.typeof("int8_t [?]")



local h
local testlen = 10
local test = char(testlen)
for i = 1, 10000000 do
  h = murmer.PMurHash32(0, test, testlen)
end
print("hash is " .. bit.tohex(h) .. "\n")

h = murmer.PMurHash32(0, "test", 4)
print("hash of test is " .. bit.tohex(h) .. "\n")

