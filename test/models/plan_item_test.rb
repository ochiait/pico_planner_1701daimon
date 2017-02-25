# encoding: UTF-8
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

require 'test_helper'

class PlanItemTest < ActiveSupport::TestCase

  def setup
    @plan_item = FactoryGirl.create(:plan_item)
  end

  test "factory girl" do
    assert_equal "Blah, Blah, Blah.", @plan_item.description
    assert @plan_item.user.kind_of?(User)
  end

end
