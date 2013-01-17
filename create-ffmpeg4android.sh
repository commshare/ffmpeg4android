#!/bin/bash

for ffmpegdir in `find ffmpeg* -maxdepth 0 -type d | sort -rV`
do
    rm -rf $ffmpegdir
done

for tarfile in `find releases/ffmpeg* | sort -rV`
do
    tar -xf $tarfile
done

RELEASE_TIMESTAMP=`date +%Y%m%d%H%M`

for ffmpegdir in `find ffmpeg* -maxdepth 0 -type d | sort -rV`
do
    mv $ffmpegdir $ffmpegdir.android

    touch -t $RELEASE_TIMESTAMP ./ffmpeg4android.readme
    cp ./ffmpeg4android.readme $ffmpegdir.android/

    for makefile in `find makefiles/* | grep .mk`
    do
        touch -t $RELEASE_TIMESTAMP $makefile
        cp $makefile ${makefile/#makefiles/$ffmpegdir.android}
    done
done

rm -rf releases.android
mkdir releases.android

for ffmpegdir in `find ffmpeg*.android -maxdepth 0 -type d | sort -rV`
do
    tar czf releases.android/$ffmpegdir.tar.gz $ffmpegdir &
done

for ffmpegdir in `find ffmpeg*.android -maxdepth 0 -type d | sort -rV`
do
    touch -t $RELEASE_TIMESTAMP releases.android/$ffmpegdir.tar.gz
done
