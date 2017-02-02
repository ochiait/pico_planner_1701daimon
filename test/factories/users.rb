# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  name                  :string           not null
#  password_digest       :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  password_confirmation :srting
#  full_name             :srting
#

FactoryGirl.define do
	factory :user do
		sequence(:name) {|n| "Taro#{n}" }
		sequence(:full_name) {|n| "Rails_Taro#{n}"}
		password "password"
	end
end
