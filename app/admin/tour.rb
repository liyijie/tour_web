ActiveAdmin.register Tour do

  menu parent: "景区资源"

  belongs_to :city, optional: true

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
  permit_params :title, :sub_title, :addr, :work_range, 
    :hint, :desc, :traffic, :lon, :lat, :city_id,
    cover_image_attributes: [:id, :desc, :photo, :_destroy],
    info_images_attributes: [:id, :desc, :photo, :_destroy]

  sidebar "景点门票", only: [:show, :edit] do
    ul do
      li link_to "#{tour.tickets.size} 张门票",    admin_tour_tickets_path(tour)
    end
  end

  action_item :new, only: :show do
    link_to '新建景点', new_admin_tour_path
  end

  index do
    column :title
    column :city
    column :tickets do |tour|
      link_to "#{tour.tickets.size} 张门票",    admin_tour_tickets_path(tour)
    end
    column :cover_image do |tour|
      link_to(image_tag(tour.cover_image.photo.url(:mini)), tour.cover_image.photo.url) if tour.cover_image
    end

    actions
  end

  form :html => {:multipart => true} do |f|
    f.inputs do 
      f.input :title
      f.input :sub_title
      f.input :city
      f.input :addr
      f.input :work_range
      f.input :lon
      f.input :lat
    end

    f.input :hint, as: :ckeditor
    f.input :desc, as: :ckeditor
    f.input :traffic, as: :ckeditor


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
        cf.input :desc, label: "图片描述"
        cf.input :photo, label: "图片文件#{image.id}", as: :file, :hint => image.photo.blank? \
          ? cf.template.content_tag(:span, "no cover page yet")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url, target: "_blank")
      end
    end
    
    f.actions
  end

  show do |tour|
    attributes_table do
      row :title
      row :sub_title
      row :city
      row :addr
      row :work_range
      row :lon
      row :lat
      row :hint do
        tour.hint.html_safe if tour.hint
      end
      row :desc do
        tour.desc.html_safe if tour.desc
      end
      row :traffic do
        tour.traffic.html_safe if tour.traffic
      end
      row :cover_image do
        if tour.cover_image
          link_to(image_tag(tour.cover_image.photo.url(:medium)), tour.cover_image.photo.url, target: "_blank")
        end
      end

    end
  end





end
