class AddNameToAnnotations < ActiveRecord::Migration
  def change
    add_column :annotations, :facebook_name, :string
  end
end
