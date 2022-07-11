Dir[File.dirname(__FILE__) + '/module/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/class/*.rb'].each {|file| require file}