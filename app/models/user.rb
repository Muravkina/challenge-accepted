class User < ActiveRecord::Base
  has_secure_password
  has_many :created_challenges, :class_name => 'Challenge', :foreign_key => 'creator_id'
  has_many :received_challenges, :class_name => 'Challenge', :foreign_key => 'challenger_id'
  has_many :accomplished_challenges
  has_many :comments
end
