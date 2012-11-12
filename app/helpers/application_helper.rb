module ApplicationHelper
  def video_status video
    if video.file_processing
      content_tag :span, 'Processing', :class => 'label label-warning'
    else
      content_tag :span, 'Active', :class => 'label label-success'
    end
  end
end
