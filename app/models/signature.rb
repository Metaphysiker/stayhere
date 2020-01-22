class Signature < ApplicationRecord
  validates :firstname, :lastname, presence: true

  validates :email, presence: true,  if: ->(o) { o.i_want_to_be_kept_up_to_date == true }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  has_one_attached :picture

  scope :with_comment, -> { where.not(comment: "") }
end
