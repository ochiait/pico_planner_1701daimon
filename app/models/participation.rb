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
# Indexes
#
#  index_participations_on_plan_item_id  (plan_item_id)
#  index_participations_on_user_id       (user_id)
#

class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :plan_item
end
