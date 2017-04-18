class Alias < ApplicationRecord

  belongs_to :item

  # Validations
  validates_presence_of :name, :item_id

  scope :for_name, -> (name) { where("name=?", name) }
  scope :alphabetical, -> { order('name') }
  scope :active,       -> { where(active: true) }
  scope :inactive,     -> { where(active: false) }

end
