ActiveAdmin.register Hotel do
  menu parent: "酒店资源"

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

  permit_params :name, :addr, :tel, :desc, :traffic, :city_id,
    cover_image_attributes: [:id, :photo, :_destroy],
    info_images_attributes: [:id, :photo, :_destroy],
    service_list: [], facility_list: []

  action_item :new, only: :show do
    link_to '新建酒店', new_admin_hotel_path
  end

  sidebar "酒店房型", only: [:show, :edit] do
    ul do
      li link_to "#{hotel.rooms.size} 个房型",    admin_hotel_rooms_path(hotel)
    end
  end

  index do
    column :name
    column :city
    column :rooms do |hotel|
      link_to "#{hotel.rooms.size} 个房型",    admin_hotel_rooms_path(hotel)
    end
    column :addr
    column :tel
    column :cover_image do |hotel|
      link_to(image_tag(hotel.cover_image.photo.url(:mini)), hotel.cover_image.photo.url) if hotel.cover_image
    end

    actions
  end

  form :html => {:multipart => true} do |f|
    f.inputs do 
      f.input :name
      f.input :city
      f.input :addr
      f.input :tel
      f.input :service_list, as: :check_boxes, collection: Hotel.services_types
      f.input :facility_list, as: :check_boxes, collection: Hotel.facilities_types
    end

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

  show do |hotel|
    attributes_table do
      row :name
      row :city
      row :addr
      row :tel
      row :service_list
      row :facility_list
      row :desc do
        hotel.desc.html_safe if hotel.desc
      end
      row :traffic do
        hotel.traffic.html_safe if hotel.traffic
      end
      row :cover_image do
        if hotel.cover_image
          link_to(image_tag(hotel.cover_image.photo.url(:medium)), hotel.cover_image.photo.url, target: "_blank")
        end
      end

    end
  end
end
