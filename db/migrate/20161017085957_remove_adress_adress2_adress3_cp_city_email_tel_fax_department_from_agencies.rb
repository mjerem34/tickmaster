class RemoveAdressAdress2Adress3CpCityEmailTelFaxDepartmentFromAgencies < ActiveRecord::Migration
  def change
    remove_column :agencies, :adress, :string
    remove_column :agencies, :adress2, :string
    remove_column :agencies, :adress3, :string
    remove_column :agencies, :cp, :string
    remove_column :agencies, :city, :string
    remove_column :agencies, :email, :string
    remove_column :agencies, :tel, :string
    remove_column :agencies, :fax, :string
    remove_column :agencies, :department, :string
  end
end
