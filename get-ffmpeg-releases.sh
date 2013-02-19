rm -rf releases

mkdir releases
cd releases

wget --content-disposition "http://git.videolan.org/?p=ffmpeg.git;a=snapshot;h=HEAD;sf=tgz"
wget http://ffmpeg.org/releases/ffmpeg-1.1.2.tar.gz
wget http://ffmpeg.org/releases/ffmpeg-1.0.4.tar.gz
wget http://ffmpeg.org/releases/ffmpeg-0.11.2.tar.gz
wget http://ffmpeg.org/releases/ffmpeg-0.10.6.tar.gz
wget http://ffmpeg.org/releases/ffmpeg-0.9.2.tar.gz
wget http://ffmpeg.org/releases/ffmpeg-0.8.12.tar.gz
wget http://ffmpeg.org/releases/ffmpeg-0.7.13.tar.gz

cd ..

