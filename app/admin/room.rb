ActiveAdmin.register Room do

  menu parent: "酒店资源"

  belongs_to :hotel, optional: true

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
  #
  #  id         :integer          not null, primary key
  #  hotel_id   :integer
  #  name       :string(255)
  #  price      :float
  #  area       :string(255)
  #  floor      :string(255)
  #  bed        :string(255)
  #  created_at :datetime
  #  updated_at :datetime
  permit_params :hotel_id, :name, :price, :area, :floor, :bed,
    :bed_list, :breakfast_list, :window_list,
    cover_image_attributes: [:id, :desc, :photo, :_destroy]

  action_item :new, only: :show do
    link_to '新建关联房型', new_admin_hotel_room_path(room.hotel)
  end

  index do
    column :hotel
    column :name
    column :price
    column :area
    column :floor
    column :bed_list
    column :breakfast_list
    column :window_list
    column :cover_image do |room|
      link_to(image_tag(room.cover_image.photo.url(:mini)), room.cover_image.photo.url) if room.cover_image
    end
    actions
  end

  show do |room|
    attributes_table do
      row :hotel
      row :name
      row :price
      row :floor
      row :area
      row :bed_list
      row :breakfast_list
      row :window_list
      row :cover_image do
        link_to(image_tag(room.cover_image.photo.url(:mini)), room.cover_image.photo.url) if room.cover_image
      end
    end
  end

  form :html => {:multipart => true} do |f|
    f.inputs do 
      f.input :hotel
      f.input :name
      f.input :price
      f.input :area
      f.input :floor
      f.input :bed_list, collection: Room.bed_types
      f.input :breakfast_list, collection: Room.breakfast_types
      f.input :window_list, collection: Room.window_types
    end

    f.inputs do
      f.fields_for :cover_image, :for => [:cover_image, f.object.cover_image || f.object.build_cover_image] do |cf|
        cover_image = cf.object
        cf.input :photo, as: :file, label: "房型图片", hint: (cover_image.photo.blank?) \
          ? cf.template.content_tag(:span, "no cover page yet")
          : cf.template.link_to(image_tag(cover_image.photo.url(:medium)), cover_image.photo.url, target: "_blank")
      end
    end

    f.actions
  end



end
