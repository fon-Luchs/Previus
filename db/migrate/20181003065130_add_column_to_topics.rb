class AddColumnToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :forum_id, :integer
  end
end
