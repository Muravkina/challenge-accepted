class AddAttachmentstoProofs < ActiveRecord::Migration
  def change
    add_attachment :proofs, :photo
    add_attachment :proofs, :video
  end
end
