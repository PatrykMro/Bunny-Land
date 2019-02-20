class AddBackgroundPictureToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :background_picture, :string
  end
end
