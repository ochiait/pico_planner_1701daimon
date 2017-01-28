FactoryGirl.define do 
	factory :user do 
		sequence(:name) {|n| "Taro#{n}" }
		sequence(:full_name) {|n| "Rails_Taro#{n}"}
		password "password"
	end 
end 
