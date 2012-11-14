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

Given /^there is a store with number (\d+) named "(.*?)"$/ do |number, name|
  i = Increment::Runner.new number.to_i, name
end

When /^I run the runner with '\-n'$/ do
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

When /^I request the list$/ do
  @list = Increment::Runner.new.list
end

When /^I run increment on "(.*?)"$/ do |name|
  Increment::Runner.new(nil, name).increment
end

Then /^a new '\.increment' file must be created in users' home\.$/ do
  File.exist?(@path).should == true
end

Then /^the number (\d+) is returned$/ do |number|
  Increment::Runner.new.number.should == number.to_i
end

Then /^the number (\d+) for "(.*?)" is returned$/ do |number, name|
  Increment::Runner.new(nil, name).number.should == number.to_i
end

Then /^the list returns "(.*?)", "(.*?)" and "(.*?)"$/ do |name1, name2, name3|
  @list.should == [name1, name2, name3]
end
