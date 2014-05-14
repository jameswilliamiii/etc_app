class AddAttachmentAvatarToClassOffers < ActiveRecord::Migration
  def self.up
    change_table :class_offers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :class_offers, :avatar
  end
end
