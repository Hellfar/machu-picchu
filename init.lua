#!/usr/bin/env torchbear

function get_table_from(path, name)
  name = name or "/import.scl"
  -- todo: fix path handling
  local scl_file = fs.read_file(path .. name)
  return scl.to_table(scl_file)
end

function table.merge( dest, source )
  for k, v in pairs( source ) do
    if ( type( v ) == "table" and type( dest[ k ] ) == "table" ) then
      -- don't overwrite one table with another
      -- instead merge them recurisvely
      table.merge( dest[ k ], v )
    else
      dest[ k ] = v
    end
  end
  return dest
end

require("configs/config")

-- todo: fs: add `basename` function
local argv0 = string.match(table.remove(arg, 1), "[^/\\]+$")

local function usage(f)
  f = f or io.stderr
  f:write(
    string.format('usage: %s [sync]\n', argv0),
    string.format('usage: %s update\n', argv0),
    string.format('usage: %s refresh\n', argv0),
    string.format('usage: %s install <package-name>\n', argv0),
    string.format('usage: %s search <package-name>\n', argv0),
    string.format('usage: %s help\n', argv0)
  )
  os.exit(f ~= io.stderr)
end

function fetch(url, rep_name, save_dir)
  save_dir = save_dir or config["DEFAULT_SAVE_DIRECTORY"]
  if fs.exists(save_dir .. rep_name) then
    return
  end
  -- TODO: use log
  print("Cloning: " .. url)
  git.clone(url, save_dir .. rep_name)
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

if cmd ~= "refresh" and fs.exists(config["REPOSITORY_HOME"]) == false then
    print("You have to first run: ./mp refresh")
    return
end

(({
  sync   = require"sync",
  update = require"update",
  refresh = require"refresh",
  search = function() require"search"(package_name) end,
  install = function() require"install"(package_name) end,
  help   = usage

})[cmd] or usage)()
