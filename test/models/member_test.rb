# encoding: UTF-8
require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  def setup
    @members = [
      FactoryGirl.create(:member, name: "tanaka", full_name: "Tanaka Jiro", number: 1),
      FactoryGirl.create(:member, name: "yamada", full_name: "Yamada Taro", number: 2),
      FactoryGirl.create(:member, name: "yamamoto", full_name: "Yamamoto Hanako", number: 3),
      FactoryGirl.create(:member, name: "suzuki", full_name: "Suzuki Saburo", number: 4),
      FactoryGirl.create(:member, name: "kuroda", full_name: "Kuroda Saburo", number: 11)
    ]
  end

  test "factory girl" do
    member = FactoryGirl.create(:member, number:5)
    assert_equal "Yamada Taro", member.full_name
  end

end
