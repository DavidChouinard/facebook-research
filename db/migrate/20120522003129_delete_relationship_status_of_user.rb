class DeleteRelationshipStatusOfUser < ActiveRecord::Migration
  def change
    remove_column :users, :relationship_status
  end
end
