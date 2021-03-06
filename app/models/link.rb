class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  acts_as_votable
  has_many :comments
  belongs_to :owner, class_name: "User", foreign_key: "user_id"


  def editable_by?(user)
    user && user == owner
  end
end
