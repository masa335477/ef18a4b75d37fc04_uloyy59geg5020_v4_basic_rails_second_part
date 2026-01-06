class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:password_digest] }
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy

  def own?(object)
    id == object&.user_id
  end
end
