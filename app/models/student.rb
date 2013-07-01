class Student < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  attr_accessible :grade, :osis_digest

  def elections
    case self.grade
    when 9
      Election.where(freshmen_eligible: true, enabled: true)
    when 10
      Election.where(sophomores_eligible: true, enabled: true)
    when 11
      Election.where(juniors_eligible: true, enabled: true)
    when 12
      Election.where(seniors_eligible: true, enabled: true)
    end
  end
end
