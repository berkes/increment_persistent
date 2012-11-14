require "fileutils"
require "./lib/increment.rb"

Given /^there is no file to store the numbers$/ do
  ENV["HOME"] = File.join("/", "tmp")
  @path = File.join ENV["HOME"], ".increment" # using temporary path
  FileUtils.rm(@path) if File.exists? @path
end

Given /^there is a store with number (\d+)$/ do |number|
  @incrementor = Increment::Runner.new number
end

When /^I run increment$/ do
  @incrementor = Increment::Runner.new
end

When /^I run increment (\d+) times$/ do |amount|
  amount.to_i.times do
    step "I run increment"
  end
end

Then /^a new '\.increment' file must be created in users' home\.$/ do
  File.exist?(@path).should == true
end

Then /^the number (\d+) is returned$/ do |number|
  @incrementor.number.should == number.to_i
end
