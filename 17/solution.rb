# vertical chamber is 7 units wide
# each rock appears two units away from the left
#
# five rock types:
#
# 1. ####
#
# 2. .#.
#    ###
#    .#.

# 3. ..#
#    ..#
#    ###

# 4. #
#    #
#    #
#    #

# 5. ##
#    ##


# tetris
#

# first jet stream push, then vertical down
# each rock appears with bottom edge three units from floor or next rock
# need to track the top

ROCKS = [["####"], [".#.", "###", ".#."], ["..#", "..#", "###"], ["#", "#", "#", "#"], ["##", "##"]]

FILE = 'sample.txt'
jetstream_instructions = File.read(FILE).split("")

current_ground_height = 0
current_rock_index = 0
rocks_fallen = 0
jetstream_index = 0
rows_so_far = ["......."]

while rocks_fallen <= 2022 do
  rock = ROCKS[current_rock_index]
  rock_height = rock.length
  rock_widest_width = rock.map(&:length).max
  distance_from_ground = 3
  distance_from_left = 2
  distance_from_right = 7 - rock_widest_width
  rock_is_alive = true

  while rock_is_alive do
    jetstream_instruction = jetstream_instructions[jetstream_index]

    horizontal_move = if jetstream_instruction == "<"
                        -1
                      else
                        1
                      end

    potential_distance_from_left = distance_from_left + horizontal_move
    potential_distance_from_right = distance_from_right - horizontal_move

    unless potential_distance_from_left < 0 || potential_distance_from_right > 7
      distance_from_left = potential_distance_from_left
      distance_from_right = potential_distance_from_right
    end
  end

  rocks_fallen += 1

  if current_rock_index < 4
    current_rock_index += 1
  else
    current_rock_index = 0
  end

  puts "#{rocks_fallen} have fallen"
end
