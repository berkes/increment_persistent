require "fileutils"
require "./lib/increment.rb"

Given /^there is no file to store the numbers$/ do
  ENV["HOME"] = File.join("/", "tmp")
  @path = File.join ENV["HOME"], ".increment" # using temporary path
  FileUtils.rm(@path) if File.exists? @path
end

Given /^I run increment$/ do
  incrementor = Increment::Incrementor.new
  incrementor.run
end

Then /^a new '\.increment' file must be created in users' home\.$/ do
  File.exist?(@path).should == true
end

