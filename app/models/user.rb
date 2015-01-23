class User < ActiveRecord::Base
  paginates_per 10
  max_paginates_per 50
  has_many :articles
  # has_many :galleries
  has_many :categories
  has_many :subcategories

  mount_uploader :avatar, AvatarUploader

  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :age, :allow_blank => true,
    numericality: { only_integer: true },
    inclusion: { in: 0..300 }
  validates :website, :allow_blank => true,
    format: { with: URI.regexp },
    if: Proc.new { |a| a.website.present? }
  validate :avatar_size_validation

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 1 MB" if avatar.size > 1.megabytes
  end
end
