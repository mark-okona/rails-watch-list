class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.text :comment
      t.references :Movie, null: false, foreign_key: true
      t.references :List, null: false, foreign_key: true

      t.timestamps
    end
  end
end
