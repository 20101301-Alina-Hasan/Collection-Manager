class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.references :collection, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :int1
      t.integer :int2
      t.integer :int3
      t.string :str1 
      t.string :str2
      t.string :str3
      t.text :txt1 
      t.text :txt2
      t.text :txt3
      t.boolean :bool1 
      t.boolean :bool2
      t.boolean :bool3 
      t.date :date1
      t.date :date2
      t.date :date3
      t.timestamps
    end
  end
end
