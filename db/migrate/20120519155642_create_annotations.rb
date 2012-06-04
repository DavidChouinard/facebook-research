class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.integer :facebook_id
      t.integer :year
      t.integer :month
      t.integer :day

      t.timestamps
    end
  end
end
