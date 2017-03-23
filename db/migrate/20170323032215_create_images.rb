class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
