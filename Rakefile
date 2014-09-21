require 'bundler/gem_tasks'
require 'yard'

YARD::Rake::YardocTask.new

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
