class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.string :image_url
      t.timestamps
    end
  end
end
