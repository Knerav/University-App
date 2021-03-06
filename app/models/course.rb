class Course < ApplicationRecord
  before_save :make_uppercase
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 40 }
  validates :short_name, presence: true, uniqueness: { case_sensitive: false }, length: { is: 5 }
  validates :description, presence: true, uniqueness: { case_sensitive: false }

  has_many :student_courses
  has_many :students, through: :student_courses
  has_many :course_categories
  has_many :categories, through: :course_categories

  def make_uppercase
    self.short_name.upcase!
  end

  private :make_uppercase
end