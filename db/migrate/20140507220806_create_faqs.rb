class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.text :question
      t.text :answer
      t.integer :class_offer_id

      t.timestamps
    end
    add_index :faqs, [ :id, :class_offer_id ]
  end
end
