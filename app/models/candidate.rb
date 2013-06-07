class Candidate < ActiveRecord::Base
  belongs_to :election
  has_many :votes, :dependent => :destroy
  attr_accessible :name

  def num_votes
    Vote.where(:candidate_id => self).count
  end
end
