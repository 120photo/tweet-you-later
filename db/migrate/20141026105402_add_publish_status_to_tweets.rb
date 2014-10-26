class AddPublishStatusToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :published, :boolean, default: false
  end
end
