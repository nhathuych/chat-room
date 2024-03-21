class User < ApplicationRecord
  has_many :messages

  validates_uniqueness_of :user_name

  def self.generate
    names = ['Thor', 'Loki', 'Odin', 'Hela', 'Hulk', 'Thanos', 'Tony-Stark', 'Black-Widow', 'Zeus', 'Hercules', 'Gorr']
    funds = ['Jump-Trading', 'A16z', 'Multicoin-Capital', 'Paradigm', 'Polychain-Capital', 'DWF-Labs']

    user_name = "#{ names.sample }-#{ funds.sample }-#{ rand(100000..999999) }"
    create(user_name: user_name)
  end
end
