class Vote < ActiveRecord::Base
  belongs_to :student
  belongs_to :candidate
  # attr_accessible :title, :body
end
