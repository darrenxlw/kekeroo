class ChangeAvatarFormatInUsers < ActiveRecord::Migration
  def up
    change_column :users, :avatar, :integer
  end

  def down
    change_column :users, :avatar, :string
  end
end