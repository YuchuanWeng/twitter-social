class Mention < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  
  def mark_viewed!
    self.update(viewed_at: Time.now)
  end
end