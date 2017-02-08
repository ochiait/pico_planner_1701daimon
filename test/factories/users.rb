# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  full_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
	factory :user do
		sequence(:name) {|n| "Taro#{n}" }
		sequence(:full_name) {|n| "Rails_Taro#{n}"}
		password "password"
	end
end
