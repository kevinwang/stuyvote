class CreateElections < ActiveRecord::Migration
  def change
    create_table :elections do |t|
      t.string :name
      t.integer :grade
      t.integer :num_choices
      t.boolean :enabled

      t.timestamps
    end
  end
end
