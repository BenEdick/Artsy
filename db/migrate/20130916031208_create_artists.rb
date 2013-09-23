class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.string :location
      t.date :dob
      t.string :p_image

      t.timestamps
    end
  end
end
