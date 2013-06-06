class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.references :election

      t.timestamps
    end
    add_index :candidates, :election_id
  end
end
