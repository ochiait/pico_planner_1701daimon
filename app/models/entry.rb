# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Entry < ApplicationRecord
  belongs_to :owner, class: "User", foreign_key: "user_id"

  validates :name, presence: true, length: { maximum: 200 }
  validates :description, :created_at, presence: true

  scope :full, ->(user) { where("user_id = user.id") }

end
