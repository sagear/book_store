class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :user] # 0 for admin , 1 for user

  after_initialize do
    if self.new_record?
      self.role ||= :user
    end
  end
end
