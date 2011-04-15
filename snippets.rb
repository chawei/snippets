# Print SQL query in console
ActiveRecord::Base.logger = Logger.new(STDOUT)

# only split at the first space
line.split(/[[:space:]+] */, 2)

# load .yml file
data = YAML.load(File.read("filename.yml"))

# date suffix
time = Time.new # Fri Oct 03 01:24:48 +0100 2008
time.strftime("%a %b #{time.day.ordinalize}") # Fri Oct 3rd

# Get the last date - http://rubyquicktips.tumblr.com/post/350625885/calculate-the-last-day-of-the-month
Date.civil(2010, 02, -1)
Sun, 28 Feb 2010