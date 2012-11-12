class VideosController < ApplicationController
  def create
    link = Importer.get(params[:video][:video_source], params[:video][:video_link])
    @video = Video.new(:title => link[:title], :file_processing => true )
    if @video.save
      VideosWorker.perform_async(@video.id, link[:url])
    end
  end
end
