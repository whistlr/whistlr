class RemoveEan13FromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :ean13, :string
  end
end
