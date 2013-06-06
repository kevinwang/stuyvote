class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :student
      t.references :candidate

      t.timestamps
    end
    add_index :votes, :student_id
    add_index :votes, :candidate_id
  end
end
