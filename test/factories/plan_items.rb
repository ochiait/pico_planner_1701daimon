# == Schema Information
#
# Table name: plan_items
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  starts_at   :datetime         not null
#  ends_at     :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_plan_items_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :plan_item do
    sequence(:name) { |n| "予定#{n}" }
    description "Blah, Blah, Blah."
    user
    starts_at 2.weeks.ago
    ends_at 2.weeks.from_now
  end
end
