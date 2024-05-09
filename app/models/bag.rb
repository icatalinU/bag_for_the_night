class Bag < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  CONDITIONS = ['New', 'Used', 'Vintage']

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,

    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
}
end
