class Campaign < ApplicationRecord
	has_many :sites, dependent: :destroy
end
