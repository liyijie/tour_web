ActiveAdmin.register Category do

  menu parent: "线路资源"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  permit_params :name, :desc,
    cover_image_attributes: [:id, :photo, :_destroy],
    banner_image_attributes: [:id, :photo, :_destroy]

  sidebar "精品路线", only: [:show, :edit] do
    ul do
      li link_to "#{category.pomotions.size} 条精品路线",    admin_category_pomotions_path(category)
    end
  end

  index do
    column :id
    column :name
    column :pomotions do |category|
      link_to "#{category.pomotions.size} 条精品路线",    admin_category_pomotions_path(category)
    end
    column :cover_image do |category|
      link_to(image_tag(category.cover_image.photo.url(:mini)), category.cover_image.photo.url) if category.cover_image
    end
    column :banner_image do |category|
      link_to(image_tag(category.banner_image.photo.url(:mini)), category.banner_image.photo.url) if category.banner_image
    end
    actions
  end

  form :html => {:multipart => true} do |f|
    category = f.object
    f.inputs do 
      f.input :name
      f.input :desc
      f.semantic_fields_for :cover_image, :for => [:cover_image, f.object.cover_image || f.object.build_cover_image] do |cf|
        cover_image = cf.object
        cf.input :photo, as: :file, label: "缩略图", hint: (cover_image.photo.blank?) \
          ? cf.template.content_tag(:span, "no cover page yet")
          : cf.template.link_to(image_tag(cover_image.photo.url(:medium)), cover_image.photo.url, target: "_blank")
      end
      f.semantic_fields_for :banner_image, :for => [:banner_image, f.object.banner_image || f.object.build_banner_image] do |cf|
        banner_image = cf.object
        cf.input :photo, as: :file, label: "高清图", hint: (banner_image.photo.blank?) \
          ? cf.template.content_tag(:span, "no cover page yet")
          : cf.template.link_to(image_tag(banner_image.photo.url(:medium)), banner_image.photo.url, target: "_blank")
      end
      
    end
    
    f.actions
  end

  show do |category|
    attributes_table do
      row :name
      row :desc
      row :cover_image do
        if category.cover_image
          link_to(image_tag(category.cover_image.photo.url(:medium)), category.cover_image.photo.url, target: "_blank")
        end
      end
      row :banner_image do
        if category.banner_image
          link_to(image_tag(category.banner_image.photo.url(:medium)), category.banner_image.photo.url, target: "_blank")
        end
      end
    end
  end


end
