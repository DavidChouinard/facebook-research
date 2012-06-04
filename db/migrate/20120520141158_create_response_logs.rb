class CreateResponseLogs < ActiveRecord::Migration
  def change
    create_table :response_logs do |t|
      t.text :content

      t.timestamps
    end
  end
end
