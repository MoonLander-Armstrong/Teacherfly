# frozen_string_literal: true

class User < ApplicationRecord
  include Slugable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  # 找到user的話就登入，找不到就create新的user

  # 定義類別方法，找到user的話就登入，找不到就建立user
  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = provider_data.info.name
    end
  end

  # validates
  validates :username, length: { maximum: 20 }

  # relationship
  has_many :courses
  has_many :comments
  has_many :orders
  has_many :reads
  has_one_attached :avatar, dependent: :destroy
  has_many :bought_courses, through: :orders, source: :course
  has_many :to_reads, through: :reads, source: :section
  belongs_to :teacher, class_name: "User", optional: true
  has_many :students, foreign_key: :teacher_id, class_name: "User"

  #scope 
  scope :ordered, -> { includes(:orders).order('orders.price') }

  def bought?(course)
    orders.where(status: "paid").exists?(course_id: course.id)
  end

  def owner?(course)
    self == course.user
  end
end
