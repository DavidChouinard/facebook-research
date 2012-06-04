class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :facebook_id
      t.integer :from
      t.integer :to
      t.integer :like_count
      t.text :content
      t.timestamp :facebook_created_at

      t.timestamps
    end
  end
end
