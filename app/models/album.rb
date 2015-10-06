class Album < ActiveRecord::Base
	has_many :photos, dependent: :destroy
	accepts_nested_attributes_for :photos, allow_destroy: true

	NAMES_IDS = self.order(name: :asc).map { |c| [c.name, c.id] }
end
