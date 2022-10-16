class Album < ApplicationRecord
  has_many :songs, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100
  before_save(:titlecase_album)

  private
    def titlecase_album
      self.name = self.name.titlecase
    end
end