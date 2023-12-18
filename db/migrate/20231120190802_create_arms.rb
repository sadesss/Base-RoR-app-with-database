class CreateArms < ActiveRecord::Migration[6.0]
  def change
    create_table :arms do |t|
      t.integer :val
      t.text :result

      t.timestamps
    end
  end
end
