class AddCompanyFields < ActiveRecord::Migration
  def change
    add_column :users, :company_url, :string
    add_column :users, :company_description, :string
  end
end
