class AddAdapterNameToPartner < ActiveRecord::Migration
  def change
    add_column :partners, :adapter_name, :string
  end
end
