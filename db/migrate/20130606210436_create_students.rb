class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :osis_digest
      t.integer :grade

      t.timestamps
    end
  end
end
