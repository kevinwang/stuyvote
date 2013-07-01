class Election < ActiveRecord::Base
  has_many :candidates, :dependent => :destroy
  attr_accessible :enabled, :freshmen_eligible, :sophomores_eligible, :juniors_eligible, :seniors_eligible, :name, :num_choices
  validates :name, presence: true
  validates :num_choices, presence: true

  def choices_remaining(student)
    self.num_choices - Vote.where(:student_id => student.id).where(:candidate_id => self.candidates).count
  end
end
