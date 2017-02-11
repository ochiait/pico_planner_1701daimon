class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :plan_item
end
