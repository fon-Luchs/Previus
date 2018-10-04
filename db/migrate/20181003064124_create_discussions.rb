class CreateDiscussions < ActiveRecord::Migration[5.2]
  def change
    create_table :discussions do |t|
      t.integer :topic_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
