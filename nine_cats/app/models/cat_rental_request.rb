class CatRentalRequest < ApplicationnRecord
    validates :status, inclusion: {in: %w(PENDING APPROVED DENIED)}
    validates :start_date, :end_date, :status, :cat_id, presence: true

    belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat 
end