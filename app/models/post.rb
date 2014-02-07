class Post < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates :group_id, presence: true
  validates :user_id, presence: true,
                      uniqueness: { scope: [:group_id, :date] }
  validates :date, presence: true
  validates :body, presence: true

  def add_comment user, body
    Comment.create post_id: self.id,
                   user_id: user.id,
                   body:    body
  end

end
