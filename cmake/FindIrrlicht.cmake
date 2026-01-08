## Try common include locations and respect IRRDIR if set
FIND_PATH(IRRLICHT_INCLUDE_DIR
  NAMES irrlicht/irrlicht.h
  PATHS
    $ENV{IRRDIR}/include
    /usr/include
    /usr/include/irrlicht
    /usr/include/irrlicht-1.8
  PATH_SUFFIXES irrlicht
)

MESSAGE(STATUS "IRRLICHT_INCLUDE_DIR = ${IRRLICHT_INCLUDE_DIR}")

## Try multiple possible library names and standard library dirs
FIND_LIBRARY(IRRLICHT_LIBRARY
  NAMES Irrlicht irrlicht libIrrlicht libirrlicht Irrlicht1.8
  PATHS
    $ENV{IRRDIR}/lib
    /usr/lib
    /usr/lib/x86_64-linux-gnu
    /usr/lib64
    /usr/local/lib
)

MESSAGE(STATUS "IRRLICHT_LIBRARY = ${IRRLICHT_LIBRARY}")

# handle the QUIETLY and REQUIRED arguments and set IRRLICHT_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(IRRLICHT DEFAULT_MSG IRRLICHT_LIBRARY IRRLICHT_INCLUDE_DIR)

IF(IRRLICHT_FOUND)
  SET(IRRLICHT_LIBRARIES ${IRRLICHT_LIBRARY})
ELSE(IRRLICHT_FOUND)
  SET(IRRLICHT_LIBRARIES)
ENDIF(IRRLICHT_FOUND)

MARK_AS_ADVANCED(IRRLICHT_LIBRARY IRRLICHT_INCLUDE_DIR)
