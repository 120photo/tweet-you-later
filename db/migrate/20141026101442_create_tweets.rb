class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body
      t.datetime :scheduled_time
      t.references :user, index: true

      t.timestamps
    end
  end
end
