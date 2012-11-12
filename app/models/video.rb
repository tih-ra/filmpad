class Video < ActiveRecord::Base
  mount_uploader :file, VideoFileUploader
  
  attr_accessor :video_source, :video_link
  SOURCES = ["kinopod"]
end
