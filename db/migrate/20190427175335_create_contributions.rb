class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.belongs_to :programmer
      t.belongs_to :repo

      t.timestamps null: false
    end
  end
end
