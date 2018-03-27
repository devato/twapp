class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.belongs_to :topic, index: true
      t.string :tweet_id
      t.string :text
      t.string :username
      t.string :full_text
      t.string :uri
      t.timestamps
    end
  end
end
