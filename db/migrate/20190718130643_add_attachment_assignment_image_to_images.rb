class AddAttachmentAssignmentImageToImages < ActiveRecord::Migration[5.2]
  def self.up
    change_table :images do |t|
      t.attachment :assignment_image
    end
  end

  def self.down
    remove_attachment :images, :assignment_image
  end
end
