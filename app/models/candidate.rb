class Candidate < ActiveRecord::Base
  belongs_to :election
  attr_accessible :name
end
