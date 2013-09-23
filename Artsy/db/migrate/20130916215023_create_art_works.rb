class CreateArtWorks < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.belongs_to :artist
      t.integer :artist_id
      t.string :name
      t.string :description
      t.string :type
      t.string :genre
      t.integer :gallery_id

      t.timestamps
    end
  end
end
