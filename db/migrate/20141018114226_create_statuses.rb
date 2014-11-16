class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
    	t.text :body
        t.integer :user_id

        t.timestamps

    end
  end
end
