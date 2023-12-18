class AddValToArms < ActiveRecord::Migration[7.1]
  def change
    add_column :arms, :val, :integer
  end
end
