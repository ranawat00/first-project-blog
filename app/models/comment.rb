class Comment < ApplicationRecord
  belongs_to :student

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
  def self.ransackable_attributes(auth_object = nil)
    ["body", "commenter", "created_at", "id", "id_value", "status", "student_id", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["student"]
  end
end
