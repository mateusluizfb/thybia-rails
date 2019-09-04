class Death < ApplicationRecord
  belongs_to :user

  def self.create_multiple(count, user)
    deaths = count.to_i.times.map { Death.new(user: user) }
    Death.import deaths
    deaths
  end
end
