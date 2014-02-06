class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates :group, presence: true
  validates :user, presence: true
end
