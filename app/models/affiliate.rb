class Affiliate < ApplicationRecord
  belongs_to :campaign
  belongs_to :advertiser
end
