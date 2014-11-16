class User < ActiveRecord::Base
   has_secure_password
   has_many :statuses
   has_many :mentions

   #has_many :relationships

   has_many :follower_relationships, class_name: "Relationship", foreign_key: "leader_id"
   has_many :leader_relationships, class_name: "Relationship", foreign_key: "follower_id"

   has_many :follower_users, through: :follower_relationships, source: :follower
   has_many :following_users, through: :leader_relationships, source: :leader

   validates :username, presence: true
   validates :email, presence: true
   
   def num_unread_mentions
     mentions.where(viewed_at: nil).count
   end
   
   def unread_mentions
     mentions.where(viewed_at: nil)
   end

   def mark_unread_mentions!
     unread_mentions.each do |mention|
       mention.mark_viewed!
     end
   end
end
