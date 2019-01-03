-- Machu Picchu
-- a general-purpose package manager

REPOSITORY_URL = "https://github.com/foundpatterns/packages"
MANIFEST_FILE = "manifest.scl"

if torchbear.os == "linux" then
  HOME = os.getenv("HOME")
  -- where repo exists
  REPOSITORY_HOME = HOME .. "/.mp/packages/"

  --  location of machu-picchu
  MP_HOME = "/usr/local/machu-picchu/"

  -- where the packages installed from repositories go
  INSTALL_HOME = "/usr/local/"

  -- where the symlink to the installed packages(from repo) exist
  BIN_HOME = "/usr/local/bin/"

  -- for dependency management
  DEFAULT_PATH           = "./"
  DEFAULT_SAVE_DIRECTORY = ".mp/"
elseif torchbear.os == "windows" then
  -- FIXME windows support
  -- TODO alternative for windows

  -- where repo exists
  REPOSITORY_HOME = "%AppData%/Roaming/.mp/packages/"

  --  location of machu-picchu
  MP_HOME = "%ProgramFiles%/mp/"

  -- where the packages installed from repositories go
  INSTALL_HOME = MP_HOME

  -- where the symlink to the installed packages(from repo) exist
  BIN_HOME = os.getenv("CMDER_ROOT") .. "/bin"

  -- for dependency management
  DEFAULT_PATH           = "./"
  DEFAULT_SAVE_DIRECTORY = ".mp/"
elseif torchbear.os == "android"
  HOME = os.getenv("HOME")
  -- where repo exists
  REPOSITORY_HOME = HOME .. "/.mp/packages/"

  --  location of machu-picchu
  MP_HOME = "/usr/local/machu-picchu/"

  -- where the packages installed from repositories go
  INSTALL_HOME = "/usr/local/"

  -- where the symlink to the installed packages(from repo) exist
  BIN_HOME = "/data/data/com.termux/files/usr/bin"

  -- for dependency management
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
