class Challenge <ActiveRecord::Base
  validates :name, presence: :true
  validates :description, presence: true
  validates :proof_description, presence: true, :if => Proc.new {|o| o.is_proof_required == true}
  validates :challenger_email, presence: true, :if => Proc.new {|o| o.is_public == false}
  belongs_to :creator, :class_name => 'User'
  belongs_to :challenger, :class_name => 'User'
  has_many :accepted_challenges
  has_many :tags
  has_many :comments, :as => :commentable
end
