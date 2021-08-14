class AddFavouriteToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :favourite, :boolean, default: false
  end
end
