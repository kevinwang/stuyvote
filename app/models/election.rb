class Election < ActiveRecord::Base
  has_many :candidates, :dependent => :destroy
  attr_accessible :enabled, :freshmen_eligible, :sophomores_eligible, :juniors_eligible, :seniors_eligible, :name, :num_choices
end
