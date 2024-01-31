class Student< ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :Name, presence: true
  validates :Login, presence: true, length: { minimum: 10 }
  def self.ransackable_associations(auth_object = nil)
    ["comments"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["Login", "Name", "created_at", "id", "id_value", "status", "updated_at"]
  end
  
end
