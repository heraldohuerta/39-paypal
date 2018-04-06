class MasterOrder < ApplicationRecord
  belongs_to :user
  has_many   :orders
  belongs_to  :billing, optional: true
end
