#!/usr/bin/env torchbear

require 'utils/fs'
require 'utils/commands'

-- This should really be refactored
require 'utils/fetch'

-- This should really be refactored
require 'utils/get_table_from'

-- Machu Picchu
-- a general-purpose package manager

require 'config'

local argv0 = fs.basename(table.remove(arg, 1))

local function usage(f)
  if not f then
    f = io.stderr
  end
  f:write(
    string.format('usage: %s [sync]\n', argv0),
    string.format('usage: %s upgrade\n', argv0),
    string.format('usage: %s refresh\n', argv0),
    string.format('usage: %s install <package-name>\n', argv0),
    string.format('usage: %s search <package-name>\n', argv0),
    string.format('usage: %s help\n', argv0)
  )
  os.exit(f ~= io.stderr)
end

local cmd = table.remove(arg, 1)
local package_name = table.remove(arg, 1)
if cmd == "install" or cmd == "search" then
  if package_name == "" or package_name == nil then
    usage()
    return
  end
end

if #arg ~= 0 then
  usage()
end

if cmd ~= "refresh" and fs.exists(config["APP_STORE_PATH"]) == false then
    print("You have to first run: ./mp refresh")
    return
end

(commands[cmd] or usage)()
