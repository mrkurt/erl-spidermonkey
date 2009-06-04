#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.61)
AC_INIT(erl-spidermonkey, 0.1, [])
AM_INIT_AUTOMAKE([1.6.3 foreign])
AC_CONFIG_SRCDIR([CHANGES])
AC_CONFIG_HEADER([config.h])

# Checks for programs.
AC_GNU_SOURCE

AC_PROG_CC

# Checks for libraries.
AC_ARG_WITH([js-include], [AC_HELP_STRING([--with-js-include=PATH],
    [set PATH to the SpiderMonkey include directory])], [
    JS_FLAGS="-I$withval"
], [
    JS_FLAGS="-I/usr/include"
    JS_FLAGS="$JS_FLAGS -I/usr/include/js"
    JS_FLAGS="$JS_FLAGS -I/usr/include/mozjs"
    JS_FLAGS="$JS_FLAGS -I/usr/local/include"
    JS_FLAGS="$JS_FLAGS -I/opt/local/include"
    JS_FLAGS="$JS_FLAGS -I/usr/local/include/js"
    JS_FLAGS="$JS_FLAGS -I/opt/local/include/js"
])

AC_ARG_WITH([js-lib], [AC_HELP_STRING([--with-js-lib=PATH],
    [set PATH to the SpiderMonkey library directory])],
    [JS_LIB_FLAGS="-L$withval"], [])

AC_ARG_VAR([FLAGS], [general flags to prepend to LDFLAGS and CPPFLAGS])

LIB_FLAGS="$JS_LIB_FLAGS -L/usr/local/lib -L/opt/local/lib"
LIBS="$LIB_FLAGS $LIBS"
# XP_UNIX required for jsapi.h and has been tested to work on Linux and Darwin.
FLAGS="$LIB_FLAGS $ERLANG_FLAGS $JS_FLAGS -DXP_UNIX $FLAGS"
CPPFLAGS="$FLAGS $CPPFLAGS"

# manually linking libm is requred for FreeBSD 7.0
LDFLAGS="$FLAGS -lm $LDFLAGS"

AC_CHECK_LIB([js], [JS_NewContext], [], [
    AC_CHECK_LIB([mozjs], [JS_NewContext], [], [
        AC_MSG_ERROR([Could not find the js library.

Is the Mozilla SpiderMonkey library installed?])])])

AC_CHECK_HEADER([jsapi.h], [], [
    AC_MSG_ERROR([Could not find the jsapi header.

Are the Mozilla SpiderMonkey headers installed?])])
AC_HEADER_STDC
AC_CHECK_HEADERS([stdlib.h string.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_TYPE_SIZE_T

# Checks for library functions.

AC_CONFIG_FILES([src/Makefile])
AC_OUTPUT
