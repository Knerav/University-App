class Course < ApplicationRecord
  before_save :make_uppercase
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 40 }
  validates :short_name, presence: true, uniqueness: { case_sensitive: false }, length: { is: 5 }
  validates :description, presence: true, uniqueness: { case_sensitive: false }

  def make_uppercase
    self.short_name.upcase!
  end

  private :make_uppercase
end