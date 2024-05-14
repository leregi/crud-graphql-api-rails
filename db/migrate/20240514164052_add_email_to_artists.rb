class AddEmailToArtists < ActiveRecord::Migration[7.1]
  def change
    add_column :artists, :email, :string
  end
end
