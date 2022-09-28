# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_secure_password

  # devise :database_authenticatable, :registerable,
  # :recoverable, :rememberable, :validatable

  has_many :resources
  has_many :resource_comments
  has_many :resource_evaluations
  has_many :completed_learning_units

  def self.handle_login(email, password)
    user = User.find_by(email: email.downcase)
    if user && user.authenticate(password)
      user_info = Hash.new
      user_info[:token] = CoreModules::JsonWebToken.encode({user_id: user.id}, 4.hours.from_now)
      user_info[:user_id] = user.id
      user_info[:name] = user.name.capitalize
      return user_info
    else
      return false
    end
  end

end
