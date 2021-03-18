class Page < ApplicationRecord
  belongs_to :notebook
  has_many :paragraphs, dependent: :destroy
end
