class Topic < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  has_many :discussions, dependent: :destroy
end
