require "fileutils"
require "./lib/increment.rb"

Given /^there is no file to store the numbers$/ do
  ENV["HOME"] = File.join("/", "tmp")
  @path = File.join ENV["HOME"], ".increment" # using temporary path
  FileUtils.rm(@path) if File.exists? @path
end

Given /^there is a store with number (\d+)$/ do |number|
  i = Increment::Runner.new number.to_i
end

Given /^I run the runner with '\-n'$/ do
  incrementor = Increment::Runner.new
  incrementor.readonly = TRUE
  incrementor.increment
end

When /^I run increment$/ do
  Increment::Runner.new.increment
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
  Increment::Runner.new.number.should == number.to_i
end
