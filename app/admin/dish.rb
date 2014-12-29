ActiveAdmin.register Dish do

  menu parent: "美食资源"

  belongs_to :shop, optional: true


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

  permit_params :name, :price, :shop_id,
    cover_image_attributes: [:id, :desc, :photo, :_destroy] 

  action_item :new, only: :show do
    link_to '新建关联菜品', new_admin_shop_dish_path(dish.shop)
  end

  index do
    column :name
    column :price
    column :shop
    column :cover_image do |dish|
      link_to(image_tag(dish.cover_image.photo.url(:mini)), dish.cover_image.photo.url) if dish.cover_image
    end
    actions 
  end

  show do |dish|
    attributes_table do
      row :name
      row :price
      row :shop
      row :cover_image do
        link_to(image_tag(dish.cover_image.photo.url(:mini)), dish.cover_image.photo.url) if dish.cover_image
      end
    end
  end

  form :html => {:multipart => true} do |f|
    f.inputs do 
      f.input :name
      f.input :price
      f.input :shop
    end

    f.inputs do
      f.fields_for :cover_image, :for => [:cover_image, f.object.cover_image || f.object.build_cover_image] do |cf|
        cover_image = cf.object
        cf.input :photo, as: :file, label: "菜品图片", hint: (cover_image.photo.blank?) \
          ? cf.template.content_tag(:span, "no cover page yet")
          : cf.template.link_to(image_tag(cover_image.photo.url(:medium)), cover_image.photo.url, target: "_blank")
      end
    end

    f.actions
  end




end
