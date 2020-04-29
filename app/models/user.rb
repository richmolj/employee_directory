class User < ApplicationRecord
  has_many :leads
  has_many :asset_types
end
