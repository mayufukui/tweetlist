class AddDateToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :date, :string
  end
end
