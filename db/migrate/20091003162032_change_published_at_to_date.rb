class ChangePublishedAtToDate < ActiveRecord::Migration
  def self.up
    change_column :posts, :published_at, :date
    Post.find(:all).each do |p|
      p.update_attribute :published_at, p.created_at
    end
  end

  def self.down
  end
end
