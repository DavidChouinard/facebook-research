class FixTypeInMessage < ActiveRecord::Migration
  def change
    rename_column :messages, :type, :post_type
  end
end
