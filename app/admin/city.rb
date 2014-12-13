ActiveAdmin.register City do


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
  permit_params :provice, :name, :desc, :position, 
    :traffic, :note, :history, :special_product,
    cover_image_attributes: [:id, :photo, :_destroy],
    banner_image_attributes: [:id, :photo, :_destroy],
    app_image_attributes: [:id, :photo, :_destroy],
    info_images_attributes: [:id, :photo, :_destroy]

  index do
    column :name
    column :desc do |city|
      truncate_html(city.desc, length: 80, omission: '...')
    end
    column :position
    column :cover_image do |city|
      link_to(image_tag(city.cover_image.photo.url(:mini)), city.cover_image.photo.url) if city.cover_image
    end
    column :banner_image do |city|
      link_to(image_tag(city.banner_image.photo.url(:mini)), city.banner_image.photo.url) if city.banner_image
    end
    actions
  end

  form :html => {:multipart => true} do |f|
    f.inputs do 
      f.input :name
      f.input :position
    end

    f.input :desc, as: :ckeditor
    f.input :traffic, as: :ckeditor
    f.input :note, as: :ckeditor
    f.input :history, as: :ckeditor
    f.input :special_product, as: :ckeditor

    f.inputs do
      f.fields_for :cover_image, :for => [:cover_image, f.object.cover_image || f.object.build_cover_image] do |cf|
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

      f.semantic_fields_for :app_image, :for => [:app_image, f.object.app_image || f.object.build_app_image] do |cf|
        app_image = cf.object
        cf.input :photo, as: :file, label: "APP图", hint: (app_image.photo.blank?) \
          ? cf.template.content_tag(:span, "no cover page yet")
          : cf.template.link_to(image_tag(app_image.photo.url(:medium)), app_image.photo.url, target: "_blank")
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

  show do |city|
    attributes_table do
      row :name
      row :position
      row :desc do
        city.desc.html_safe
      end
      row :cover_image do
        if city.cover_image
          link_to(image_tag(city.cover_image.photo.url(:medium)), city.cover_image.photo.url, target: "_blank")
        end
      end
      row :banner_image do
        if city.banner_image
          link_to(image_tag(city.banner_image.photo.url(:medium)), city.banner_image.photo.url, target: "_blank")
        end
      end
      row :app_image do
        if city.app_image
          link_to(image_tag(city.app_image.photo.url(:medium)), city.app_image.photo.url, target: "_blank")
        end
      end
    end
  end




end
