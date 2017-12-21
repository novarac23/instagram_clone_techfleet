class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :user, foreign_key: true
      t.string :image_uid
      t.string :image_name

      t.timestamps
    end
  end
end
