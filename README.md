ruby bindings to [libgroove][libgroove].

## Installation

First install [libgroove][libgroove] (see below) then:

    gem install ruby-groove

### libgroove

#### Ubuntu, FreeBSD and Debian

Ubuntu, FreeBSD and Debian users can use a [pre-built package][packages].

#### Mac OS X

Install dependencies from [Homebrew][brew]

~~~ sh
brew install chromaprint
brew install libav --with-libvorbis --with-speex
brew install sdl2
~~~

Install [libebur128][libebur128] from source

~~~ sh
git clone https://github.com/jiixyj/libebur128
cd libebur128
mkdir build
cd build
cmake ..
make
make install
~~~

Install [libgroove][libgroove] from source

~~~ sh
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

## Generating the bindings

[ffi_gen][ffi_gen] automatically creates the bindings from the
[libgroove][libgroove] header files. Use the included [Vagrantfile][vagrant]
and the steps below to setup a build environment.

~~~ sh
# host computer
cd ruby-groove
vagrant up
vagrant ssh
~~~

~~~ sh
# virtual machine
sudo apt-add-repository ppa:andrewrk/libgroove
sudo apt-get update
sudo apt-get install libgroove-dev libgrooveplayer-dev libgrooveloudness-dev libgroovefingerprinter-dev ruby ruby-dev clang libclang-dev llvm llvm-dev
sudo ln -sv /usr/lib/llvm-3.4/lib/libclang.so /usr/lib/libclang.so
sudo gem install bundler
cd /vagrant
bundle install
rake generate_ffi
~~~

Bindings are output to `lib`.

## Contributing

1. [Fork it](https://github.com/johnmuhl/ruby-groove/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[brew]: http://brew.sh/
[ffi_gen]: https://github.com/neelance/ffi-gen
[libebur128]: https://github.com/jiixyj/libebur128
[libgroove]: https://github.com/andrewrk/libgroove
[packages]: https://github.com/andrewrk/libgroove#pre-built-packages
[vagrant]: http://www.vagrantup.com/
