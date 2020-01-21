class Signature < ApplicationRecord
  validates :firstname, :lastname, presence: true
end
