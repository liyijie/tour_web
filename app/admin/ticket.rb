ActiveAdmin.register Ticket do

  menu parent: "景区资源"

  belongs_to :tour, optional: true
  # navigation_menu :tour
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
  permit_params :style, :title, :desc, :price, :tour_id, :position

  index do
    column :id
    column :tour
    column :title
    column :style
    column :price

    actions
  end


end
