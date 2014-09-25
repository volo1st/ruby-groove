# read or update metadata in a media file

require "groove/groove"

def usage
  puts "Usage: ruby #{__FILE__} <file> [--update key value] [--delete key]"
  puts "Repeat --update and --delete as many times as you need to."
  exit 1
end

return usage if ARGV.empty?

puts "Using libgroove v#{Groove.version}"

Groove.init
at_exit { Groove.finish }
Groove.set_logging(Groove::GROOVE_LOG_INFO)

argv = ARGV
path = File.expand_path(argv.first)
file = Groove.file_open(path)

unless file
  STDERR.puts "error opening file: #{path}"
  exit 1
end

argv.shift
argv.each do |arg|
  case argv.first
  when /--delete/
    key = argv[1]
    argv.slice!(0..1)
    unless key
      Groove.file_close(file)
      STDERR.puts "--delete requires 1 argument"
      return usage
    end
    Groove.file_metadata_set(file, key, nil, 0)
  when /--update/
    key = argv[1]
    val = argv[2]
    argv.slice!(0..2)
    unless key && val
      Groove.file_close(file)
      STDERR.puts "--update requires 2 arguments"
      return usage
    end
    Groove.file_metadata_set(file, key, val, 0)
  end
end

tag = Groove.file_metadata_get(file, "", nil, 0)
while tag != nil
  puts "#{Groove.tag_key(tag)}=#{Groove.tag_value(tag)}"
  tag = Groove.file_metadata_get(file, "", tag, 0)
end
puts "duration=#{Groove.file_duration(file)}"

if (Groove::GrooveFile.new(file)[:dirty] && Groove.file_save(file)) < 0
  STDERR.puts "Error saving file: #{path}"
end

Groove.file_close(file)
