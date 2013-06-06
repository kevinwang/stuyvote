class ChangeGradeRepresentationOfElections < ActiveRecord::Migration
  def up
    add_column :elections, :freshmen_eligible, :boolean
    add_column :elections, :sophomores_eligible, :boolean
    add_column :elections, :juniors_eligible, :boolean
    add_column :elections, :seniors_eligible, :boolean
    remove_column :elections, :grade
  end

  def down
    remove_column :elections, :freshmen_eligible, :boolean
    remove_column :elections, :sophomores_eligible, :boolean
    remove_column :elections, :juniors_eligible, :boolean
    remove_column :elections, :seniors_eligible, :boolean
    add_column :elections, :grade, :integer
  end
end
