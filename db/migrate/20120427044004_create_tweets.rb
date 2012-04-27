class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :content
      t.integer :user_id
      t.integer :tweet_id
      t.timestamps
    end
  end
end
