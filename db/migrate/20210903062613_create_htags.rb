class CreateHtags < ActiveRecord::Migration[6.1]
  def change
    create_table :htags do |t|
      t.string :name

      t.timestamps
    end
  end
end


