class ChangeFacebookIdToMessage < ActiveRecord::Migration
  def up
    change_table :messages do |t|
      t.change :facebook_id, :string
    end
  end

  def down
    change_table :messages do |t|
      t.change :facebook_id, :bigint
    end
  end
end
