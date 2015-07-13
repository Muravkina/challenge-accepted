class Challenge <ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :challenger, :class_name => 'User', :foreign_key => 'challenger_id'
  has_many :accomplished_challenges
  has_many :tags
  has_many :comments, :as => :commentable
end
