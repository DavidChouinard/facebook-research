class AddNewFieldsToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :application_name, :string
    add_column :messages, :has_link, :boolean
    add_column :messages, :has_video, :boolean
    add_column :messages, :has_with_tag, :boolean
    add_column :messages, :has_place, :boolean
  end
end
