AC_PREREQ([2.67])
AC_INIT([Octave-Forge miscellaneous package], [1.2.0+])

## these are C headers required for text_waitbar
AC_CHECK_HEADER([term.h],
  [],
  [AC_CHECK_HEADER([termcap.h],
    [],
    [AC_MSG_ERROR([Unable to find ncurses library headers.])]
  ])
)

AC_PROG_CXX
AC_LANG(C++)

## this is required for the units.m function
AC_CHECK_PROG(UNITS_AVAILABLE, units, yes)
if test x"$UNITS_AVAILABLE" != x"yes" ; then
  AC_MSG_ERROR([The program GNU Units is required to install $PACKAGE_NAME.])
fi
