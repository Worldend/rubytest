class User < ActiveRecord::Base
  enum sex: {gender: '0', female: '1', male: '2'}
end
