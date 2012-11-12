class VideosWorker
  include Sidekiq::Worker
  
  def perform(video_id, video_url)
    video = Video.find(video_id)
    video.update_attributes(:file_processing => false, :remote_file_url => video_url )
  end
end