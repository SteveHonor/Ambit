class User < ActiveRecord::Base
  belongs_to :management
  has_many :infractions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
