class ChangeToBigintInAnnotations < ActiveRecord::Migration
  def change
    change_column :annotations, :facebook_id, :bigint
  end
end
