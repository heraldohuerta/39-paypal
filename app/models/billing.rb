class Billing < ApplicationRecord
  belongs_to :user
  has_many  :master_orders
end
