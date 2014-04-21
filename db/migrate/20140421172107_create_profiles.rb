class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string  :name
      t.string  :company
      t.boolean :public
      t.text    :details
      t.string  :twitter
      t.string  :facebook
      t.string  :linkedin
      t.string  :github
      t.string  :website
      t.string  :email

      t.timestamps
    end
  end
end
