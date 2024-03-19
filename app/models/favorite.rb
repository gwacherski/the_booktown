class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :roteiro

  def self.exists_for?(user, roteiro)
    where(user: user, roteiro: roteiro).exists?
  end
  
end
