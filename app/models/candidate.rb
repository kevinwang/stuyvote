class Candidate < ActiveRecord::Base
  belongs_to :election
  has_many :votes, :dependent => :destroy
  attr_accessible :name
end
