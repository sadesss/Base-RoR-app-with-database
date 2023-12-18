class CreateUsers < ActiveRecord::Migration[7.1]
  create_table :arms do |t|
    t.integer :val
    t.text :result
  
    t.timestamps
  end
  
end

