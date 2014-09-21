require 'bundler/gem_tasks'
require 'yard'

YARD::Rake::YardocTask.new

# I can’t get this to work on a Mac.
# For now use the Vagrantfile to boot Ubuntu and run:
# sudo apt-add-repository ppa:andrewrk/libgroove
# sudo apt-get update
# sudo apt-get install libgroove-dev libgrooveplayer-dev libgrooveloudness-dev libgroovefingerprinter-dev
# sudo apt-get install ruby ruby-dev
# sudo apt-get install clang libclang-dev llvm llvm-dev
# sudo ln -sv /usr/lib/llvm-3.4/lib/libclang.so /usr/lib/libclang.so
# sudo gem install bundler
# cd /vagrant
# bundle install
# rake generate_ffi
desc 'Generate FFI bindings'
task :generate_ffi do
  require 'ffi_gen'

  FFIGen.generate(
    module_name: 'Groove',
    ffi_lib:     'groove',
    headers:     ['/usr/include/groove/groove.h',
                  '/usr/include/groove/groove.h',
                  '/usr/include/groove/queue.h'],
    cflags:      `llvm-config --cflags`.split(' '),
    prefixes:    ['groove_'],
    output:      'lib/groove.rb'
  )

  FFIGen.generate(
    module_name: 'Groove::Fingerprinter',
    ffi_lib:     'groovefingerprinter',
    headers:     ['/usr/include/groovefingerprinter/fingerprinter.h'],
    cflags:      `llvm-config --cflags`.split(' '),
    prefixes:    ['groove_'],
    output:      'lib/groove/fingerprinter.rb'
  )

  FFIGen.generate(
    module_name: 'Groove::Loudness',
    ffi_lib:     'grooveloudness',
    headers:     ['/usr/include/grooveloudness/loudness.h'],
    cflags:      `llvm-config --cflags`.split(' '),
    prefixes:    ['groove_'],
    output:      'lib/groove/loudness.rb'
  )

  FFIGen.generate(
    module_name: 'Groove::Player',
    ffi_lib:     'grooveplayer',
    headers:     ['/usr/include/grooveplayer/player.h'],
    cflags:      `llvm-config --cflags`.split(' '),
    prefixes:    ['groove_'],
    output:      'lib/groove/player.rb'
  )
end
