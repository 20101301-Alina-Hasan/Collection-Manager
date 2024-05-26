class User < ApplicationRecord
    has_secure_password
    has_many :collections

    # Validation for username
    validates :username, presence: true, uniqueness: { message: "is already taken." }
    validates_format_of :username, with: /\A[a-zA-Z][a-zA-Z0-9_.]+\z/, message: "should start with a letter and contain only letters, numbers, underscores, or periods"

    # Validation for name
    validates :name, presence: true
  
    # Validation for email
    validates :email, presence: true, uniqueness: { message: "is already in use." },  format: { with: URI::MailTo::EMAIL_REGEXP}
  
    # Validation for password
    validates :password, presence: true, if: -> {password_confirmation.present?} # length: { minimum: 1} Use to change length if needed
    validates :password_confirmation, presence: true, if: -> { password.present? }

    # Validation for status
    validates :status, inclusion: { in: [true, false] }
    validates :admin, inclusion: { in: [true, false] }

    before_validation :downcase_username

    def downcase_username
        self.username = username.downcase if username.present?
    end

    def self.ransackable_attributes(auth_object = nil)
        %w[id username name email admin status created_at updated_at]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end

end
