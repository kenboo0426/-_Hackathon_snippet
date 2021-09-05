class AddColumnComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :comment, :string
  end
end
