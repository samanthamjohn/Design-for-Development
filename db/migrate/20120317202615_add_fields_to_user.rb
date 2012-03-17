class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :company_name, :string
    add_column :users, :looking_for, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :talent_type, :string
    add_column :users, :available, :boolean
  end
end
