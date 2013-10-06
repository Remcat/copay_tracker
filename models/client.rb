require 'data_mapper' # metagem, requires common plugins too.
require 'sinatra/base'

# need install dm-sqlite-adapter
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/copays.db")

class Client < Sinatra::Base
  include DataMapper::Resource
  property :id, Serial
  property :first_name, String
  property :last_name,  String
  property :copay_amount, Integer
  property :effective_as_of, DateTime
end

DataMapper.finalize

# automatically create the client table
Client.auto_upgrade!
