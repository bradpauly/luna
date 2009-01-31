class RemoveIntro < ActiveRecord::Migration
  def self.up
    remove_column :posts, :intro
  end

  def self.down
    add_column :posts, :intro, :string
  end
end
