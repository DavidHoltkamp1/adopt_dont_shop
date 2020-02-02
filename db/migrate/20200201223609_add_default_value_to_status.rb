class AddDefaultValueToStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :pets, :status, :string, :default => "Adoptable"
  end
end
