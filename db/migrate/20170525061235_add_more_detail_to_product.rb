class AddMoreDetailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :prees, :string
    add_column :products, :subtitle, :string
    add_column :products, :translator, :string
    add_column :products, :year, :integer
    add_column :products, :pages, :integer
    add_column :products, :ISBN, :integer
    add_column :products, :about_author, :text
  end
end
