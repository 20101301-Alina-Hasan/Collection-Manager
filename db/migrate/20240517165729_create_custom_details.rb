class CreateCustomDetails < ActiveRecord::Migration[7.1]
  def change
      create_table :custom_details,  id: false do |t|
        t.references :collection, null: false, primary_key: true
        t.boolean :int1_flag, default: false
        t.string :int1_name
        t.boolean :int2_flag, default: false
        t.string :int2_name
        t.boolean :int3_flag, default: false
        t.string :int3_name
        t.boolean :str1_flag, default: false
        t.string :str1_name
        t.boolean :str2_flag, default: false
        t.string :str2_name
        t.boolean :str3_flag, default: false
        t.string :str3_name
        t.boolean :txt1_flag, default: false
        t.string :txt1_name
        t.boolean :txt2_flag, default: false
        t.string :txt2_name
        t.boolean :txt3_flag, default: false
        t.string :txt3_name
        t.boolean :bool1_flag, default: false
        t.string :bool1_name
        t.boolean :bool2_flag, default: false
        t.string :bool2_name
        t.boolean :bool3_flag, default: false
        t.string :bool3_name
        t.boolean :date1_flag, default: false
        t.string :date1_name
        t.boolean :date2_flag, default: false
        t.string :date2_name
        t.boolean :date3_flag, default: false
        t.string :date3_name
        t.timestamps
      end
    end
end