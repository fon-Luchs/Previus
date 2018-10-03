class Topic < ApplicationRecord
  belongs_to :forum
  has_many :discussion, dependent: :destroy
end
