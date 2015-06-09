class ChangeDepartmentToString < ActiveRecord::Migration
  def up
    change_column :requests, :department, :string
  end

  def down
    remove_column :requests, :department
    add_column :requests, :department, :boolean
  end
end
