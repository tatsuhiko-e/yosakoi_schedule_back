# frozen_string_literal: true

class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates :name, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
