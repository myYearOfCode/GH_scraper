class CreateReposTable < ActiveRecord::Migration[5.2]
  def change
    create_table :repos do |t|
      t.string :name, null: false
      t.string :description
      t.string :language
      t.string :contributors_list

      t.timestamps null: false
    end
  end
end
