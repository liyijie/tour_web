ActiveAdmin.register Shop do

  menu parent: "美食资源"

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

  permit_params :name, :addr, :tel, :special, :work_range, :price_avg, :city_id,
    cover_image_attributes: [:id, :desc, :photo, :_destroy],
    info_images_attributes: [:id, :desc, :photo, :_destroy]

  sidebar "美食菜品", only: [:show, :edit] do
    ul do
      li link_to "#{shop.dishes.size} 个菜品",    admin_shop_dishes_path(shop)
    end
  end

  action_item :new, only: :show do
    link_to '新建商家', new_admin_shop_path
  end

  index do
    column :name
    column :city
    column :addr
    column :tel
    column :price_avg
    column do |shop|
      link_to "#{shop.dishes.size} 个菜品",    admin_shop_dishes_path(shop)
    end
    column :cover_image do |shop|
      link_to(image_tag(shop.cover_image.photo.url(:mini)), shop.cover_image.photo.url) if shop.cover_image
    end

    actions
  end

  form :html => {:multipart => true} do |f|
    f.inputs do 
      f.input :name
      f.input :city
      f.input :addr
      f.input :tel
      f.input :work_range
      f.input :price_avg
    end

    f.input :special, as: :ckeditor

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

  show do |shop|
    attributes_table do
      row :name
      row :city
      row :addr
      row :tel
      row :work_range
      row :price_avg
      row :special do
        shop.special.html_safe if shop.special
      end
      row :cover_image do
        if shop.cover_image
          link_to(image_tag(shop.cover_image.photo.url(:medium)), shop.cover_image.photo.url, target: "_blank")
        end
      end
    end
  end

end
