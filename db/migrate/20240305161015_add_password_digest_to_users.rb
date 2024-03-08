class AddPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password, :string # Remove the plain text password column
    add_column :users, :password_digest, :string # Add the password_digest column
  end
end

