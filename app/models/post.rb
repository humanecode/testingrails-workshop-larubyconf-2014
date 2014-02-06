class Post < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates :group_id, presence: true
  validates :user_id, presence: true,
                      uniqueness: { scope: [:group_id, :date] }
  validates :date, presence: true
  validates :body, presence: true
end
