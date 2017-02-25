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

class User < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :participating_plan_items, through: :participations,
    source: :plan_item
  has_many :plan_items

  validates :name,  presence: true
  validates :password, presence: { on: :create },
  confirmation: { allow_blank: true }
  has_secure_password
end
