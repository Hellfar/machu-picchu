-- Machu Picchu
-- a general-purpose package manager

CONFIG_FILES_PATH = "./configs/"
BASE_CONF = "base.scl"
LINUX_CONF = "linux-os.scl"
WINDOWS_CONF = "windows-os.scl"
ANDROID_CONF = "android-os.scl"

config = {}

function append_config(path, name)
  config = table.merge(config, get_table_from(path, name))
  return config
end

append_config(CONFIG_FILES_PATH, BASE_CONF)

if torchbear.os == "linux" then
  append_config(CONFIG_FILES_PATH, LINUX_CONF)
elseif torchbear.os == "windows" then
  append_config(CONFIG_FILES_PATH, WINDOWS_CONF)
elseif torchbear.os == "android" then
  append_config(CONFIG_FILES_PATH, ANDROID_CONF)
end
