-- Machu Picchu
-- a general-purpose package manager

REPOSITORY_URL = "https://github.com/foundpatterns/packages"
MANIFEST_FILE = "manifest.scl"

if torchbear.os == "linux" then
  REPOSITORY_HOME = os.getenv("HOME") .. "/.mp/packages/"
  -- requires sudo
  MP_HOME = "/usr/share/mp/"
  INSTALL_HOME = "/usr/share/"
  -- INSTALL_HOME = os.getenv("HOME") .. "/.mp/"
  BIN_HOME = "/usr/bin/"

  DEFAULT_PATH           = "./"
  DEFAULT_SAVE_DIRECTORY = ".mp/"
elseif torchbear.os == "windows" then
  -- FIXME windows support
  -- TODO alternative for windows

  REPOSITORY_HOME = os.getenv("HOME") .. "/.mp/packages/"
  MP_HOME = "/usr/share/mp/"
  INSTALL_HOME = "/usr/share/"
  -- INSTALL_HOME = os.getenv("HOME") .. "/.mp/"
  BIN_HOME = "/usr/bin/"

  DEFAULT_PATH           = "./"
  DEFAULT_SAVE_DIRECTORY = ".mp/"
end

-- SCL file keys
URL           = "url"
RECURSIVE     = "recursive"
EXPORT        = "export"
PLUCK         = "pluck"
REPO          = "repo"
LOCAL_IMPORT  = "local_import"
