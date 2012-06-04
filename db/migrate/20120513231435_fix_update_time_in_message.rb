class FixUpdateTimeInMessage < ActiveRecord::Migration
  def change
    rename_column :messages, :facebook_update_time, :facebook_updated_time
  end
end
