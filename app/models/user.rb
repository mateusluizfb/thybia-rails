class User < ApplicationRecord
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :deaths
  has_many :collected_coins
  has_many :killed_monsters

  def killed_amount(monster:)
    KilledMonster
      .with_user(self)
      .with_monster(monster)
      .count
  end
end
