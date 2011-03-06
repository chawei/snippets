# Print SQL query in console
ActiveRecord::Base.logger = Logger.new(STDOUT)