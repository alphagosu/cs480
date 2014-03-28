class User < ActiveRecord::Base
  has_many :collaborations
end
