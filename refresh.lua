-- get file from remote server
-- udpates existing file
local function refresh()
  if fs.exists(config["REPOSITORY_HOME"]) then
    git.reset(config["REPOSITORY_HOME"], "origin/master", "hard")
    git.pull(config["REPOSITORY_HOME"], "origin", "master")
  else
    fetch(config["REPOSITORY_URL"], "", config["REPOSITORY_HOME"])
  end
end

return refresh
