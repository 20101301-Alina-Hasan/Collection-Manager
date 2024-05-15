class CreateItemToTags < ActiveRecord::Migration[7.1]
  def change
    create_table :item_to_tags, primary_key: [:item_id, :tag_id]  do |t|
      t.references :item, null: false, foreign_key: true
      t.references :tag, null:false, foreign_key: true
      t.timestamps
    end
  end
end
