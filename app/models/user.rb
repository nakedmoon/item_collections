class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_presence_of :password_confirmation, if: :password_required?


  protected

    def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end


end
