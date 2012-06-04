class ChangeColumnTypeOfMessages < ActiveRecord::Migration
  def up
    change_table :comments do |t|
      t.change :from, :bigint
      t.change :to, :bigint
    end
  end

  def down
    change_table :comments do |t|
      t.change :from, :integer
      t.change :to, :integer
    end
  end
end
