module ApplicationHelper
  def href_trans content
    content.to_s.gsub "/ckeditor_assets", "http://www.gt278.com/ckeditor_assets"
  end

  def set_mode mode
    @mode = mode
  end
end
