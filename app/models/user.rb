class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :filiations, dependent: :destroy
  has_many :children, through: :filiations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  enum role: { nanny: 0, family: 1 }
end
