# Generated by ffi_gen. Please do not change this file by hand.

require 'ffi'

module Groove::Player
  extend FFI::Library
  ffi_lib 'grooveplayer'
  
  def self.attach_function(name, *_)
    begin; super; rescue FFI::NotFoundError => e
      (class << self; self; end).class_eval { define_method(name) { |*_| raise e } }
    end
  end
  
  # (Not documented)
  # 
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:groove_player_event_type).</em>
  # 
  # === Options:
  # :nowplaying ::
  #   when the currently playing track changes.
  # :bufferunderrun ::
  #   when something tries to read from an empty buffer
  # 
  # @method _enum_groove_player_event_type_
  # @return [Symbol]
  # @scope class
  enum :groove_player_event_type, [
    :nowplaying, 0,
    :bufferunderrun, 1
  ]
  
  # (Not documented)
  # 
  # = Fields:
  # :type ::
  #   (Symbol from _enum_groove_player_event_type_) 
  class GroovePlayerEvent < FFI::Union
    layout :type, :groove_player_event_type
  end
  
  # (Not documented)
  # 
  # = Fields:
  # :device_index ::
  #   (Integer) set this to the device you want to open
  #   could also be GROOVE_PLAYER_DEFAULT_DEVICE or GROOVE_PLAYER_DUMMY_DEVICE
  # :target_audio_format ::
  #   (unknown) The desired audio format settings with which to open the device.
  #   groove_player_create defaults these to 44100 Hz,
  #   signed 16-bit int, stereo.
  #   These are preferences; if a setting cannot be used, a substitute will be
  #   used instead. actual_audio_format is set to the actual values.
  # :device_buffer_size ::
  #   (Integer) how big the device buffer should be, in sample frames.
  #   must be a power of 2.
  #   groove_player_create defaults this to 1024
  # :sink_buffer_size ::
  #   (Integer) how big the sink buffer should be, in sample frames.
  #   groove_player_create defaults this to 8192
  # :gain ::
  #   (Float) This volume adjustment to make to this player.
  #   It is recommended that you leave this at 1.0 and instead adjust the
  #   gain of the underlying playlist.
  #   If you want to change this value after you have already attached the
  #   sink to the playlist, you must use groove_player_set_gain.
  #   float format. Defaults to 1.0
  # :playlist ::
  #   (FFI::Pointer(*GroovePlaylist)) read-only. set when you call groove_player_attach and cleared when
  #   you call groove_player_detach
  # :actual_audio_format ::
  #   (unknown) read-only. set to the actual format you get when you open the device.
  #   ideally will be the same as target_audio_format but might not be.
  class GroovePlayer < FFI::Struct
    layout :device_index, :int,
           :target_audio_format, :char,
           :device_buffer_size, :int,
           :sink_buffer_size, :int,
           :gain, :double,
           :playlist, :pointer,
           :actual_audio_format, :char
  end
  
  # (Not documented)
  # 
  # @method device_count()
  # @return [Integer] 
  # @scope class
  attach_function :device_count, :groove_device_count, [], :int
  
  # Returns the name of the audio device at the requested index, or NULL on error
  # The string returned by this function is UTF-8 encoded, read-only, and
  # managed internally. You are not to free it. If you need to keep the string
  # for any length of time, you should make your own copy of it.
  # 
  # @method device_name(index)
  # @param [Integer] index 
  # @return [String] 
  # @scope class
  attach_function :device_name, :groove_device_name, [:int], :string
  
  # (Not documented)
  # 
  # @method player_create()
  # @return [GroovePlayer] 
  # @scope class
  attach_function :player_create, :groove_player_create, [], GroovePlayer
  
  # (Not documented)
  # 
  # @method player_destroy(player)
  # @param [GroovePlayer] player 
  # @return [nil] 
  # @scope class
  attach_function :player_destroy, :groove_player_destroy, [GroovePlayer], :void
  
  # Attaches the player to the playlist instance and opens the device to
  # begin playback.
  # Internally this creates a GrooveSink and sends the samples to the device.
  # you must detach a player before destroying it or the playlist it is
  # attached to
  # returns 0 on success, < 0 on error
  # 
  # @method player_attach(player, playlist)
  # @param [GroovePlayer] player 
  # @param [FFI::Pointer(*GroovePlaylist)] playlist 
  # @return [Integer] 
  # @scope class
  attach_function :player_attach, :groove_player_attach, [GroovePlayer, :pointer], :int
  
  # returns 0 on success, < 0 on error
  # 
  # @method player_detach(player)
  # @param [GroovePlayer] player 
  # @return [Integer] 
  # @scope class
  attach_function :player_detach, :groove_player_detach, [GroovePlayer], :int
  
  # get the position of the play head
  # both the current playlist item and the position in seconds in the playlist
  # item are given. item will be set to NULL if the playlist is empty
  # you may pass NULL for item or seconds
  # 
  # @method player_position(player, item, seconds)
  # @param [GroovePlayer] player 
  # @param [FFI::Pointer(**GroovePlaylistItem)] item 
  # @param [FFI::Pointer(*Double)] seconds 
  # @return [nil] 
  # @scope class
  attach_function :player_position, :groove_player_position, [GroovePlayer, :pointer, :pointer], :void
  
  # returns < 0 on error, 0 on no event ready, 1 on got event
  # 
  # @method player_event_get(player, event, block)
  # @param [GroovePlayer] player 
  # @param [GroovePlayerEvent] event 
  # @param [Integer] block 
  # @return [Integer] 
  # @scope class
  attach_function :player_event_get, :groove_player_event_get, [GroovePlayer, GroovePlayerEvent, :int], :int
  
  # returns < 0 on error, 0 on no event ready, 1 on event ready
  # if block is 1, block until event is ready
  # 
  # @method player_event_peek(player, block)
  # @param [GroovePlayer] player 
  # @param [Integer] block 
  # @return [Integer] 
  # @scope class
  attach_function :player_event_peek, :groove_player_event_peek, [GroovePlayer, :int], :int
  
  # See the gain property of GrooveSink. It is recommended that you leave this
  # at 1.0 and instead adjust the gain of the playlist.
  # returns 0 on success, < 0 on error
  # 
  # @method player_set_gain(player, gain)
  # @param [GroovePlayer] player 
  # @param [Float] gain 
  # @return [Integer] 
  # @scope class
  attach_function :player_set_gain, :groove_player_set_gain, [GroovePlayer, :double], :int
  
end
