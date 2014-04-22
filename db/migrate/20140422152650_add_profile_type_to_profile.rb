class AddProfileTypeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :profile_type, :string
    add_index :profiles, :profile_type
  end
end
