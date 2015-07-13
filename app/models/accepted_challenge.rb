class AcceptedChallenge < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  has_many :comments, :as => :commentable
  has_many :proofs
end
