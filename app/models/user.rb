class User < ActiveRecord::Base
  acts_as_taggable_on :ability
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_admin, :username, :ability_list
  has_many :comments

  #validates :username, presence: true, length: { maximum: 50 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true,
                    #format: { with: VALID_EMAIL_REGEX },
                    #uniqueness: { case_sensitive: false }
  #validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def to_s
    username
  end
  def admin?
    is_admin and is_admin > 0
  end
  def self.ability_list
    %w/create_post destroy_post update_post destroy_comment/
  end
  # attr_accessible :title, :body
end
