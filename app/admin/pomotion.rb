ActiveAdmin.register Pomotion do

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

  permit_params :title, :sub_title, :content, :rate, :category_id,
    cover_image_attributes: [:id, :photo, :_destroy],
    info_images_attributes: [:id, :photo, :_destroy]

  index do
    column :category
    column :title
    column :sub_title
    column :rate
    column :cover_image do |pomotion|
      link_to(image_tag(pomotion.cover_image.photo.url(:mini)), pomotion.cover_image.photo.url) if pomotion.cover_image
    end

    actions
  end

  form :html => {:multipart => true} do |f|
    f.inputs do 
      f.input :category
      f.input :title
      f.input :sub_title
      f.input :rate
    end

    f.input :content, as: :ckeditor

    f.inputs do
      f.fields_for :cover_image, :for => [:cover_image, f.object.cover_image || f.object.build_cover_image] do |cf|
        cover_image = cf.object
        cf.input :photo, as: :file, label: "缩略图", hint: (cover_image.photo.blank?) \
          ? cf.template.content_tag(:span, "no cover page yet")
          : cf.template.link_to(image_tag(cover_image.photo.url(:medium)), cover_image.photo.url, target: "_blank")
      end
    end

    f.inputs do
      f.has_many :info_images, :allow_destroy => true, :new_record => true do |cf|
        image = cf.object
        cf.input :photo, label: "#{image.id}", as: :file, :hint => image.photo.blank? \
          ? cf.template.content_tag(:span, "no cover page yet")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url, target: "_blank")
      end
    end
    
    f.actions
  end

  show do |pomotion|
    attributes_table do
      row :category
      row :title
      row :sub_title
      row :rate
      row :content do
        pomotion.content.html_safe if pomotion.content
      end
      row :cover_image do
        if pomotion.cover_image
          link_to(image_tag(pomotion.cover_image.photo.url(:medium)), pomotion.cover_image.photo.url, target: "_blank")
        end
      end

    end
  end



end
