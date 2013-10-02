# run this file at the command line: rspec blog_post_scheduler_spec.rb

# remember that tests can be your to-do list, and that you should get one
# test to pass at a time, doing the simplest thing you can for each one.

# read your rspec output carefully to find what you need to fix. the errors
# will guide you!

require_relative './spec_helper.rb'
require_relative './blog_post_scheduler.rb'

describe "Blog Post Scheduler" do

  describe "#create_groups" do
    # A bit about this let method below.
    # # http://betterspecs.org/#let
    # let will create a method named after the argument
    # that will execute the associated block every time 
    # it is called. It is a semantic way to define
    # subjects for your tests.

    # tl;dr - you call group_size in your test, it returns 4
    let (:group_size) { 4 } 
    let (:students) { get_students }
    let (:num_groups) { 20 }

    it "returns an array of groups" do
      create_groups(students, group_size, 20).class.should eq(Array)
    end

    it "sets group sizes to the size given" do
      create_groups(students, group_size, 20).first.size.should eq(group_size)
    end

    it "creates the right number of groups" do
      create_groups(students, group_size, 20).size.should eq(num_groups)
    end

    it "uses every student in the list for a large enough number of groups" do
      groups = create_groups(students, group_size, 11)
      students.sort.should eq(groups.flatten.uniq.sort)
    end

    it "attempts to randomize the list" do
      groups = create_groups(students, group_size, 11)
      groups.flatten.should_not eq(students)
    end

    it "uses some studens more than once for a large enough number of groups" do
       groups = create_groups(students, group_size, 1000)
       groups.each do |group|
         group.size.should eq(group_size)
       end
    end

    it "doesn't repeat students on adjacent days" do
      groups = create_groups(students, group_size, 20)
      groups.each_with_index do |group, i|
        (group & groups[i+1]).should eq([]) if i < groups.size - 1

        # the bitwise & (not &&) operator creates an array that
        # is the intersection of two arrays, meaning the common
        # elements. Try this in IRB by creating:
        # array1 = [1,2,3]
        # array2 = [4,5,6]
        # array3 = [1,5,9]
        # then type array1 & array2, array1 & array3, etc

        # This single line test is the equivalent of doing:

        #group.each do |g|
          #groups[i+1].include?(g).should be_false if i < groups.size - 1
        #end
      end
    end
  end
end

def get_students
  [
  "Alex Chiu",
  "Amanda Himmelstoss",
  "Anders Ramsay",
  "Bana Malik",
  "Brendan Manley",
  "Charlotte Chang",
  "Christopher Lee",
  "Daniel Chang",
  "David Bella",
  "Edina Vath",
  "Emily Xie",
  "Greg Eng",
  "Ian Miller",
  "Iris Lee",
  "Ivan Brennan",
  "James Tong",
  "Jeanne Roniger",
  "Joe O'Conor",
  "John Richardson",
  "Joshua Scaglione",
  "Kyle Shike",
  "Logan Hasson",
  "Manuel Neuhauser",
  "Margaret Lee",
  "Matt Campbell",
  "Michael Polycarpou",
  "Mike Spangler",
  "Raymond Gan",
  "Rosanne Hoyem",
  "Sam Yang",
  "Samuel Owens",
  "Saron Yitbarek",
  "Scott Luptowski",
  "Vivian Zhang",
  "Sonja Hall",
  "Stephanie Oh",
  "Theo Vora",
  "Thomas Surgent",
  "Tiffany Peon",
  "Trevor McKendrick",
  "Vinney Cavallo"
  ]
end
