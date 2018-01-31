class Campaign < ApplicationRecord
	has_many :affiliates
	belongs_to :advertiser
end
