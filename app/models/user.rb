class User < ActiveRecord::Base
  validates_presence_of :login, :password
  enum sex: {gender: '0', female: '1', male: '2'}  
  #attribute_accessible :sex
end
