class CreateHearts < ActiveRecord::Migration[7.1]
  def change
    create_table :hearts, primary_key: [:user_id, :item_id] do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
