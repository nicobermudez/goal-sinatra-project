ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])


configure :development do
  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
end

configure :production do
 db = "postgres://ikpimkzqqprigx:e1e1ef812be078a498531b1b9369a8decd9e66aff358a407c4add245b2116b34@ec2-54-197-239-115.compute-1.amazonaws.com:5432/d2ck2qmokrbn69"

 ActiveRecord::Base.establish_connection(
   :adapter  => 'postgresql',
   :host     => 'ec2-54-197-239-115.compute-1.amazonaws.com',
   :username => 'ikpimkzqqprigx',
   :password => 'e1e1ef812be078a498531b1b9369a8decd9e66aff358a407c4add245b2116b34',
   :database => 'postgresql-slippery-26582',
   :encoding => 'utf8'
 )
end

require_all 'app'
