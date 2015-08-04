class AddImageandTitleToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :image, :string
    add_column :bookmarks, :title, :string
  end
end
