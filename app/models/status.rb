class Status < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :creator, presence: true
  validates :body, presence: true, length: {minimum: 5}
  
  after_save :extract_mentions

  def extract_mentions
  	mentions = self.body.scan(/@(\w*)/)
  	if mentions.size > 0
  		mentions.each do |mention|
          m = mention.first
           user = User.find_by username: m
           if user
    	     Mention.create(user_id: user.id, status_id: self.id)
           end
        end
    end
  end
  #execute every time after save
 
end
										