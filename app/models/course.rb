class Course < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 40 }
  validates :short_name, presence: true, uniqueness: { case_sensitive: false }, length: { is: 5 }
  validates :description, presence: true, uniqueness: { case_sensitive: false }
end