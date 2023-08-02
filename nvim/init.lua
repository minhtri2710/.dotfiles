require('beowulf.base')
require('beowulf.highlights')
require('beowulf.maps')
require('beowulf.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac then
  require('beowulf.macos')
end
if is_win then
  require('beowulf.windows')
end
if is_wsl then
  require('beowulf.wsl')
end
