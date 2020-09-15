class AddZipToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :zip, :string
  end
end
