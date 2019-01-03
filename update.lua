local function update(path)
  path = path or config["DEFAULT_PATH"]
  local table = get_table_from(path)
  for rep_name, location in pairs(table.imports) do
    git.pull(config["DEFAULT_SAVE_DIRECTORY"] .. rep_name, "origin", "master")

    if table[rep_name][config["RECURSIVE"]] == true then
      update(config["DEFAULT_SAVE_DIRECTORY"] .. rep_name)
    end
  end
end

return update
