require 'data_mapper'
require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/students.db")


class Students
  include DataMapper::Resource   # mixin 
  property :studentid, Serial 
  property :firstname, String 
  property :lastname, String 
  property :birthday, String 
  property :address, String 
end 

class Comment
  include DataMapper::Resource   # mixin 
  property :commentid, Serial
  property :name, String
  property :comment, String
  property :created_at, DateTime
end

DataMapper.finalize
DataMapper.auto_migrate!
DataMapper.auto_upgrade!
