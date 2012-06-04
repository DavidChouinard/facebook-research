class ChangeDataTypeForLocationId < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :location_id, :bigint
    end
  end

  def down
    change_table :users do |t|
      t.change :location_id, :integer
    end
  end
end
