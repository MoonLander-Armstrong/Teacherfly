require "streamio-ffmpeg"
 
class MediaUploader < Shrine
  plugin :add_metadata
  plugin :determine_mime_type
 
  add_metadata do |io, context|
    movie = Shrine.with_file(io) { |file| FFMPEG::Movie.new(file.path) }
 
    { "duration"   => movie.duration,
      "bitrate"    => movie.bitrate,
      "resolution" => movie.resolution,
      "frame_rate" => movie.frame_rate }
  end
end