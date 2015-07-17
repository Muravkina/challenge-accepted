class Proof < ActiveRecord::Base
  belongs_to :accepted_challenge
   # This method associates the attribute ":photo" with a file attachment
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  has_attached_file :video



  validates_attachment_content_type :photo, :content_type => [/png\Z/, /jpe?g\Z/]
end
