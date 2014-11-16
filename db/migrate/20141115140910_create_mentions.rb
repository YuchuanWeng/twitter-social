class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
    	t. integer :user_id, :status_id
    	t.timestamps
    	
    end
  end
end
