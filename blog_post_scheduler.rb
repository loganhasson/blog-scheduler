# create a method called create_groups that, given an array of student names,
# a group size, and a number of groups, will return an array of groups of
# of students with no student in adjacent groups

def create_groups(student_list, group_size, num_groups)
  groups_array = []
  random_list = student_list.shuffle

  while random_list.size > 0
    mini_group = []
    mini_group = random_list.slice(0,group_size)
    random_list = random_list.drop(group_size)
    groups_array << mini_group
  end

  i = 0
  while groups_array.size < num_groups
    extra_group = groups_array[i]
    groups_array << extra_group
    i += 1
  end

  groups_array
end

# take the list and divide it up into a list of group size
# if there aren't enough students to make the correct number of groups,
# take students from beginning of list and keep adding
