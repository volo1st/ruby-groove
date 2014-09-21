ruby bindings to [libgroove][libgroove].

## Installation

First install [libgroove][libgroove] (see below) then:

    gem install ruby-groove

### libgroove

#### Ubuntu, FreeBSD and Debian

Ubuntu, FreeBSD and Debian users can use a [pre-built package][packages].

#### Mac OS X

~~~ sh
# Install dependencies from Homebrew
brew install chromaprint
brew install libav --with-libvorbis --with-speex --with-libvpx
brew install sdl2

# libebur128 is not on Homebrew so install from source
git clone https://github.com/jiixyj/libebur128
cd libebur128
mkdir build
cd build
cmake ..
make
make install

# Install libgroove from git; 4.1.1 doesn't build on OS X 10.9
git clone https://github.com/andrewrk/libgroove
cd libgroove
mkdir build
cd build
cmake ..
make
make install
~~~

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/johnmuhl/ruby-groove/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[libgroove]: https://github.com/andrewrk/libgroove
[packages]: https://github.com/andrewrk/libgroove#pre-built-packages
