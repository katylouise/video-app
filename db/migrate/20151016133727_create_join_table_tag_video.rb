class CreateJoinTableTagVideo < ActiveRecord::Migration
  def change
    create_join_table :tags, :videos do |t|
       t.index [:tag_id, :video_id]
       t.index [:video_id, :tag_id]
    end
  end
end
