class Ingredient < ApplicationRecord
  has_many :doses

  before_destroy :before_destroy_check_for_dose_children

  validates :name, presence: true
  validates :name, uniqueness: true

  private

  def before_destroy_check_for_dose_children
    unless doses.count.zero?
      raise "Can't destroy ingredient because it has dose children"
    end
  end
end
