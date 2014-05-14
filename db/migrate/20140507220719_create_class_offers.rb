class CreateClassOffers < ActiveRecord::Migration
  def change
    create_table :class_offers do |t|
      t.text :summary
      t.date :start_date
      t.date :end_date
      t.string :non_member_cost
      t.string :standard_member_cost
      t.string :premier_member_cost
      t.string :teacher
      t.string :status
      t.string :name
      t.string :non_member_link
      t.string :standard_member_link
      t.string :premier_member_link
      t.string :time
      t.text :teacher_profile
      t.text :requirements
      t.text :learning_points

      t.timestamps
    end
    add_index :class_offers, [ :id, :start_date ]
  end
end
