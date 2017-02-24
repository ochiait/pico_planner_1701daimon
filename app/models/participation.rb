# == Schema Information
#
# Table name: participations
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  plan_item_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :plan_item
end
