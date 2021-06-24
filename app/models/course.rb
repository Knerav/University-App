class Course < ApplicationRecord
  before_save :make_uppercase
  
  def make_uppercase
    self.short_name.upcase!
  end
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 40 }
  validates :short_name, presence: true, uniqueness: { case_sensitive: false }, length: { is: 5 }
  validates :description, presence: true, uniqueness: { case_sensitive: false }

  has_many :student_courses
  has_many :students, through: :student_courses

  private :make_uppercase
end