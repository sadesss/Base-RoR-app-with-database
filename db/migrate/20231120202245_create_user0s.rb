class CreateUser0s < ActiveRecord::Migration[7.1]
  def change
    create_table :arms do |t|
      t.integer :val
      t.text :result
    
      t.timestamps
    end
    
  end
end
