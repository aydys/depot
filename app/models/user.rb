class User < ApplicationRecord
  has_secure_password

  attribute :current_password, :string

  validate :password_challenge, on: :update

  after_destroy :ensure_an_admin_remains


  def password_challenge
    if authenticate(current_password)
      errors.add(:current_password, 'is not valid')
    end
  end

  class Error < StandardError
  end

  private

    def ensure_an_admin_remains
      if User.count.zero?
        raise Error.new "Can't delete last user"
      end
    end
end
