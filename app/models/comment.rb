class Comment < ActiveRecord::Base
  belongs_to :article
  validates :article, presence: true
  validates :commenter, :body, presence: true, length: { minimum: 5 }
end
