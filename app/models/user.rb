class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable #, authentication_keys: [:login]
  belongs_to :role
  has_many :type_policies, as: :subject
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :groups

  has_one_attached :avatar
  validate :avatar_type

  # attr_writer :login
  # validates :username, presence: true, uniqueness: { case_sensitive: false }
  # validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # def login
  #   @login || self.username || self.email
  # end
  #
  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   elsif conditions.has_key?(:username) || conditions.has_key?(:email)
  #     where(conditions.to_h).first
  #   end
  # end
  def full_name
    "#{givenname} #{surname}"
  end

  def avatar_type
    if avatar.attached?
      unless avatar.content_type.in?(%('image/jpeg image/png image/jpg image/gif'))
        errors.add(:avatar, 'type needs to be a jpg/jpeg/png/gif')
      end
      unless avatar.byte_size <= 1.megabyte
        errors.add(:avatar, 'is too big')
      end
    end
  end
end
