class AddAttachmentPhotoToRecipeImages < ActiveRecord::Migration
  def self.up
    change_table :recipe_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :recipe_images, :photo
  end
end
