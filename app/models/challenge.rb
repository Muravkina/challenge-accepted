class Challenge <ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  belongs_to :challenger, :class_name => 'User'
  has_many :accepted_challenges
  has_many :tags
  has_many :comments, :as => :commentable
end
