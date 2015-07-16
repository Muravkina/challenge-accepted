class AcceptedChallenge < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  has_many :comments, :as => :commentable
  has_many :proofs
  accepts_nested_attributes_for :proofs, allow_destroy: true

  validates :proofs, length: { maximum: 3 }
end
