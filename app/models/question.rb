class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
