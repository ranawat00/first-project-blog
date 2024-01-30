class Student < ApplicationRecord
  validates :Name, presence: true
  validates :Login, presence: true, length: { minimum: 10 }
end
