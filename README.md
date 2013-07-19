ffmpeg4android
==============

building support of ffmpeg project in android platform


FFmpeg for Android is a set of Android makefiles which enable configuration
and building FFmpeg library under Android source code tree with Android
NDK.

While working as a system integrator, I have come upon more than few
Android ports of FFmpeg library. All of them have some non-features in
common:

- It is not possible to use configure script to configure the library. This
  may lead to invalid library configuration and output and degraded
  performance or feature set.
- Some FFmpeg libraries are missing. Usually, only libavutil, libavcodec
  and libavformat are built.
- FFmpeg tools (ffmpeg, ffplay, ffprobe, ffserver) are missing.
- Manually added files into Android.mk, usually without proper
  understanding of dependencies between files and function of each file
  in a library.
- Configuration is locked to single architecture.
- The library can not be built in parallel for different target products
  and architectures. This is important for large test environments.
- Missing or incomplete compiler and linker flags.
- Building library in a "It compiles = It is working" manner.
- Building library as a large single file.

This project is my attempt to address these and many other issues and
create makefiles for building FFmpeg library under Android source code tree
which will create output as close as possible to the output of "regular"
building process using standalone toolchain. These makefiles are result of
combining and extending various makefiles I have found on the web and
during my work.

Features
========

On-the-fly library configuration. FFmpeg will be configured on-the-fly,
during Android building process, in accordance to the selected product,
cpu architecture, cpu architecture variant, and fine tuning cpu
parameters.

Configuration driven building. No need to manually add filenames to the
makefiles, or hack through the library in order to get the build you
want.

Per product configuration. Every TARGET_PRODUCT will have its own
configuration.

Builds all libraries and tools, except ffplay.

Builds both shared and static libraries.

Builds latest releases form 0.7, 0.8, 0.9, 0.10, 0.11, 1.0, 1.1, 1.2, 2.0 and
HEAD branches.

Supports parallel building from the same source for the different
products.

Usage
=====

Extract ffmpeg-<version>.android.tar.gz into Android source code tree, at
location:

<android-src-root-dir>/external

Files will be located in:

<android-src-root-dir>/external/ffmpeg-<version>.android

Edit Android_configuration.mk and apply your customizations to the
./configure parameters, if needed.

Initialize Android build environment:

cd <android-src-root-dir>
. build/envsetup.sh
lunch <product>

To configure and build the library, run

make

or

make libz
cd external/ffmpeg-<version>.android; mm;

If there is no existing library configuration for a selected product, the
library will be configured on the fly, during building process, with
parameters provided in Android_configuration.mk. Whenever you change
configuration parameters, the library will be reconfigured.

Compiled FFmpeg libraries and tools will have version suffix, eg
libavcodec-1.0.a, libavutil-1.0.so, ffprobe-1.0

Revision history
================
Fored from git://git.code.sf.net/p/ffmpeg4android/code

License
=======

GNU General Public License version 3.0 (GPLv3)
