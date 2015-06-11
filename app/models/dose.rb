class Dose < ActiveRecord::Base
  belongs_to :cocktails
  belongs_to :ingredients
end
