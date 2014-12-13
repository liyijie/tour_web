module ApplicationHelper
  def href_trans content
    content.to_s.gsub "/ckeditor_assets", "http://192.168.0.103:3000/ckeditor_assets"
  end
end
