# read or update metadata in a media file

require 'groove/groove'

puts "Using libgroove v#{Groove.version}"

def usage
  puts "Usage: ruby #{__FILE__} <file> [--update key value] [--delete key]"
  puts 'Repeat --update and --delete as many times as you need to.'
  exit 1
end

return usage if ARGV.empty?

Groove.init

argv = ARGV
path = File.expand_path ARGV.first
file = Groove.file_open path

argv.shift

unless file
  STDERR.puts "Error opening file: #{path}"
  exit 1
end

groove_file = Groove::GrooveFile.new file

unless argv.empty?
  while !argv.empty?
    case argv.first
    when /--/
      case argv.first
      when '--delete'
        key = argv[1]
        argv.slice! 0..1

        unless key
          Groove.file_close file
          STDERR.puts '--delete requires 1 argument'
          return usage
        end

        Groove.file_metadata_set file, key, nil, 0
      when '--update'
        key = argv[1]
        val = argv[2]
        argv.slice! 0..2

        unless key && val
          Groove.file_close file
          STDERR.puts '--update requires 2 arguments'
          return usage
        end

        Groove.file_metadata_set file, key, val, 0
      else
        return usage
      end
    end
  end
end

puts "duration = #{Groove.file_duration file}"

tag = Groove.file_metadata_get(file, '', tag, 0)

while tag != nil
  puts "#{Groove.tag_key tag} = #{Groove.tag_value tag}"
  tag = Groove.file_metadata_get(file, '', tag, 0)
end

if groove_file[:dirty] > 0
  Groove.file_save file
end

Groove.file_close file
Groove.finish
