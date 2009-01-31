class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :intro
      t.text :body
      t.string :state
      t.time :published_at

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
