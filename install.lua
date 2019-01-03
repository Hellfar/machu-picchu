local function install(name) 

  local packages_table = get_table_from(config["REPOSITORY_HOME"], config["MANIFEST_FILE"])

  if packages_table[name] == nil then
    print("Package not found")
    return
  end

  fetch(packages_table[name], name, config["INSTALL_HOME"])
  local src_path = string.format("%s/%s/init.lua", config["INSTALL_HOME"], name)
  local dest_path = string.format("%s/%s", config["BIN_HOME"], name)
  fs.symlink(src_path, dest_path)
end

return install
