class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_favourites
  # has_one :shortlist, dependent: :destroy

  has_one :shortlist, dependent: :destroy
  has_many :opportunities, dependent: :destroy

  has_one_attached :photo

  private

  def create_favourites
    Shortlist.create(user: self, name: "My favourites")
  end
end
