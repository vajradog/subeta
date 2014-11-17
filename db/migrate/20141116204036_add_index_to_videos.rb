class AddIndexToVideos < ActiveRecord::Migration
  def change
  	add_index :videos, :uid, unique: true
  end
end
