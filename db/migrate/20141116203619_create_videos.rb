class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.string :link
      t.string :title
      t.string :author
      t.string :duration
      t.integer :likes
      t.integer :dislikes
      t.string :uid
      t.text :description

      t.timestamps
    end
  end
end
