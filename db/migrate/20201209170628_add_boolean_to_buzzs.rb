class AddBooleanToBuzzs < ActiveRecord::Migration[6.0]
  def change
    add_column :buzzs, :buzzed, :boolean
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
