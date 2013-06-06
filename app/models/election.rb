class Election < ActiveRecord::Base
  attr_accessible :enabled, :grade, :name, :num_choices
end
