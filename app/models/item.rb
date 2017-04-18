class Item < ApplicationRecord

  # Relationships
  has_many :item_locations
  has_many :item_counties
  has_many :counties, through: :item_counties
  has_many :locations, through: :item_locations
  has_many :addresses, through: :locations
  has_many :aliases

  accepts_nested_attributes_for :aliases, reject_if: lambda { |a| a[:alias].blank? }, allow_destroy: true

  # Validations
  validates_presence_of :name

  # Scopes
  scope :alphabetical, -> { order('name') }
  scope :active,       -> { where(active: true) }
  scope :inactive,     -> { where(active: false) }
  scope :for_name, -> (name) { where("name=?", name) }

end
