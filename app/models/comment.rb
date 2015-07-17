class Comment < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :accepted_challenge
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
