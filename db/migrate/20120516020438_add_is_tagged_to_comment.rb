class AddIsTaggedToComment < ActiveRecord::Migration
  def change
    add_column :messages, :recipient_is_tagged, :boolean
  end
end
