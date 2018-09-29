## Note only improper and becket dances are handled
### Question: should the %w be %symbol instead?
## For hard coding purposes, I will enter data like: %w(neighbor_swing) and the result will be ['neigbor_swing']. This will have to be converted to 'Neighbor Swing' on the Frontend

## Positions still need short lines down the hall positions, probably others too

class Seed

  def self.begin
    Dance.destroy_all
    Move.destroy_all
    PossibleMoveStartPosition.destroy_all
    DanceMove.destroy_all
    Position.destroy_all
    seed = Seed.new
    seed.populate_all_positions
    seed.populate_moves
    seed.populate_possible_move_start_positions
    seed.populate_dance_move_data_for_heartbeat_contra
  end

  def populate_all_positions
    ## r-orient refers to rightmost person facing up, s-orient refers to rightmost person facing down (shape of short wavy line shaped like R or S)
    ## negative_slope refers to a h4 group in long_lines making a \ shape, positive_slope refers to a h4 group in long_lines making a / shape
    positions = %w(
      improper
      improper_progressed
      becket
      opposite_becket
      side_of_set_with_neighbor_ones_facing_up
      side_of_set_with_neighbor_ones_facing_down

      long_lines_larks_facing_in_negative_slope_partner_on_same_side_ones_on_right
      long_lines_larks_facing_in_negative_slope_partner_on_same_side_ones_on_left
      long_lines_larks_facing_in_negative_slope_neighbor_on_same_side_ones_near_top
      long_lines_larks_facing_in_negative_slope_neighbor_on_same_side_ones_near_bottom
      long_lines_larks_facing_in_positive_slope_partner_on_same_side_ones_on_right
      long_lines_larks_facing_in_positive_slope_partner_on_same_side_ones_on_left
      long_lines_larks_facing_in_positive_slope_neighbor_on_same_side_ones_near_top
      long_lines_larks_facing_in_positive_slope_neighbor_on_same_side_ones_near_bottom

      long_lines_ravens_facing_in_negative_slope_partner_on_same_side_ones_on_right
      long_lines_ravens_facing_in_negative_slope_partner_on_same_side_ones_on_left
      long_lines_ravens_facing_in_negative_slope_neighbor_on_same_side_ones_near_top
      long_lines_ravens_facing_in_negative_slope_neighbor_on_same_side_ones_near_bottom
      long_lines_ravens_facing_in_positive_slope_partner_on_same_side_ones_on_right
      long_lines_ravens_facing_in_positive_slope_partner_on_same_side_ones_on_left
      long_lines_ravens_facing_in_positive_slope_neighbor_on_same_side_ones_near_top
      long_lines_ravens_facing_in_positive_slope_neighbor_on_same_side_ones_near_bottom

      short_wavy_lines_ravens_in_middle_ones_on_right
      short_wavy_lines_ravens_in_middle_ones_on_left
      short_wavy_lines_ravens_in_middle_ones_facing_down
      short_wavy_lines_ravens_in_middle_ones_facing_up
      short_wavy_lines_larks_in_middle_ones_on_right
      short_wavy_lines_larks_in_middle_ones_on_left
      short_wavy_lines_larks_in_middle_ones_facing_down
      short_wavy_lines_larks_in_middle_ones_facing_up

      short_wavy_lines_r_orient_ones_in_middle_raven_one_facing_down
      short_wavy_lines_r_orient_ones_in_middle_raven_one_facing_up
      short_wavy_lines_r_orient_ones_on_outside_raven_one_facing_up
      short_wavy_lines_r_orient_ones_on_outside_raven_one_facing_down
      short_wavy_lines_r_orient_ones_on_left_raven_one_facing_up
      short_wavy_lines_r_orient_ones_on_left_raven_one_facing_down
      short_wavy_lines_r_orient_ones_on_right_raven_one_facing_down
      short_wavy_lines_r_orient_ones_on_right_raven_one_facing_down
      short_wavy_lines_s_orient_ones_in_middle_raven_one_facing_down
      short_wavy_lines_s_orient_ones_in_middle_raven_one_facing_up
      short_wavy_lines_s_orient_ones_on_outside_raven_one_facing_up
      short_wavy_lines_s_orient_ones_on_outside_raven_one_facing_down
      short_wavy_lines_s_orient_ones_on_left_raven_one_facing_up
      short_wavy_lines_s_orient_ones_on_left_raven_one_facing_down
      short_wavy_lines_s_orient_ones_on_right_raven_one_facing_down
      short_wavy_lines_s_orient_ones_on_right_raven_one_facing_down
    )
    positions.each do |position_description|
      Position.create!(description: position_description)
    end
  end

  def populate_moves ## currently now just those for heartbeat.
    ## Should be alphabetical
    moves = %w(
      balance_the_ring
      california_twirl
      circle_left_three_quarters
      dancers_on_left_right_shoulder_round_once_and_a_half
      neighbor_swing
      partner_balance
      partner_swing
      petronella
    )

    moves.each do |move_name|
      move = Move.create!(name: move_name)
    end
  end

  def populate_possible_move_start_positions
    ## for heartbeat contra moves
    moves_and_possible_start_positions = {
      'balance_the_ring' => %w(improper improper_progressed becket opposite_becket side_of_set_with_neighbor_ones_facing_up side_of_set_with_neighbor_ones_facing_down),

      'petronella' => %w(improper improper_progressed becket opposite_becket side_of_set_with_neighbor_ones_facing_up side_of_set_with_neighbor_ones_facing_down),

      'neighbor_swing' => %w(improper improper_progressed side_of_set_with_neighbor_ones_facing_up side_of_set_with_neighbor_ones_facing_down),

      'dancers_on_left_right_shoulder_round_once_and_a_half' => %w(improper improper_progressed becket opposite_becket side_of_set_with_neighbor_ones_facing_up side_of_set_with_neighbor_ones_facing_down long_lines_larks_facing_in_positive_slope_partner_on_same_side_ones_on_right long_lines_larks_facing_in_positive_slope_partner_on_same_side_ones_on_left long_lines_larks_facing_in_positive_slope_neighbor_on_same_side_ones_near_top long_lines_larks_facing_in_positive_slope_neighbor_on_same_side_ones_near_bottom long_lines_ravens_facing_in_positive_slope_partner_on_same_side_ones_on_right long_lines_ravens_facing_in_positive_slope_partner_on_same_side_ones_on_left long_lines_ravens_facing_in_positive_slope_neighbor_on_same_side_ones_near_top long_lines_ravens_facing_in_positive_slope_neighbor_on_same_side_ones_near_bottom),

      'partner_swing' => %w(becket opposite_becket long_lines_larks_facing_in_negative_slope_partner_on_same_side_ones_on_right long_lines_larks_facing_in_negative_slope_partner_on_same_side_ones_on_left long_lines_larks_facing_in_positive_slope_partner_on_same_side_ones_on_right long_lines_larks_facing_in_positive_slope_partner_on_same_side_ones_on_left long_lines_ravens_facing_in_negative_slope_partner_on_same_side_ones_on_right long_lines_ravens_facing_in_negative_slope_partner_on_same_side_ones_on_left long_lines_ravens_facing_in_positive_slope_partner_on_same_side_ones_on_right long_lines_ravens_facing_in_positive_slope_partner_on_same_side_ones_on_left short_wavy_lines_ravens_in_middle_ones_on_right short_wavy_lines_ravens_in_middle_ones_on_left short_wavy_lines_larks_in_middle_ones_on_right short_wavy_lines_larks_in_middle_ones_on_left short_wavy_lines_r_orient_ones_on_left_raven_one_facing_up        short_wavy_lines_r_orient_ones_on_left_raven_one_facing_down        short_wavy_lines_r_orient_ones_on_right_raven_one_facing_down        short_wavy_lines_r_orient_ones_on_right_raven_one_facing_down       short_wavy_lines_s_orient_ones_on_left_raven_one_facing_up short_wavy_lines_s_orient_ones_on_left_raven_one_facing_down short_wavy_lines_s_orient_ones_on_right_raven_one_facing_down short_wavy_lines_s_orient_ones_on_right_raven_one_facing_down),

      'circle_left_three_quarters' => %w(improper improper_progressed becket opposite_becket side_of_set_with_neighbor_ones_facing_up side_of_set_with_neighbor_ones_facing_down),

      'partner_balance' => %w(becket opposite_becket long_lines_larks_facing_in_negative_slope_partner_on_same_side_ones_on_right long_lines_larks_facing_in_negative_slope_partner_on_same_side_ones_on_left long_lines_larks_facing_in_positive_slope_partner_on_same_side_ones_on_right long_lines_larks_facing_in_positive_slope_partner_on_same_side_ones_on_left long_lines_ravens_facing_in_negative_slope_partner_on_same_side_ones_on_right long_lines_ravens_facing_in_negative_slope_partner_on_same_side_ones_on_left long_lines_ravens_facing_in_positive_slope_partner_on_same_side_ones_on_right long_lines_ravens_facing_in_positive_slope_partner_on_same_side_ones_on_left short_wavy_lines_ravens_in_middle_ones_on_right short_wavy_lines_ravens_in_middle_ones_on_left short_wavy_lines_larks_in_middle_ones_on_right short_wavy_lines_larks_in_middle_ones_on_left short_wavy_lines_r_orient_ones_on_left_raven_one_facing_up        short_wavy_lines_r_orient_ones_on_left_raven_one_facing_down        short_wavy_lines_r_orient_ones_on_right_raven_one_facing_down        short_wavy_lines_r_orient_ones_on_right_raven_one_facing_down       short_wavy_lines_s_orient_ones_on_left_raven_one_facing_up short_wavy_lines_s_orient_ones_on_left_raven_one_facing_down short_wavy_lines_s_orient_ones_on_right_raven_one_facing_down short_wavy_lines_s_orient_ones_on_right_raven_one_facing_down),

      'california_twirl' => %w(improper improper_progressed becket opposite_becket side_of_set_with_neighbor_ones_facing_up side_of_set_with_neighbor_ones_facing_down),
    }

    moves_and_possible_start_positions.each do |move_name, possible_positions|
      possible_positions.each do |position_description|
        position = Position.find_by(description: position_description)
        move = Move.find_by(name: move_name)
        PossibleMoveStartPosition.create!(position_id: position.id, move_id: move.id)
      end
    end

  end

  def populate_dance_move_data_for_heartbeat_contra
    dance = Dance.create!(name: 'Heartbeat Contra', writer: 'Don Flaherty', is_becket: false)
    dance_moves_and_ending_positions = [ ## this needs to be an array of arrays so I can use the index to update number_in_dance
      ['balance_the_ring', 'improper'],
      ['petronella', 'opposite_becket'],
      ['balance_the_ring', 'opposite_becket'],
      ['petronella', 'improper_progressed'],
      ['balance_the_ring', 'improper_progressed'],
      ['neighbor_swing', 'side_of_set_with_neighbor_ones_facing_down'],
      ['dancers_on_left_right_shoulder_round_once_and_a_half', 'opposite_becket'],
      ['partner_swing', 'opposite_becket'],
      ['circle_left_three_quarters', 'improper_progressed'],
      ['balance_the_ring', 'improper_progressed'],
      ['california_twirl', 'improper']
    ]

    dance_moves_and_ending_positions.each_with_index do |move_ending_position_pair, index|
      move = Move.find_by(name: move_ending_position_pair[0])
      position_this_move_ends_at = Position.find_by(description: move_ending_position_pair[1])

      dance_move = DanceMove.new(
        dance_id: dance.id,
        move_id: move.id,
        number_in_dance: index
      )

      ## don't really need to validate that this move's end is a possible start positions for the next move, because they should only be able to choose possible next move starting positions. But for these purposes, to ensure I'm hard-coding correctly,

      ## First, find the next move
      if index == dance_moves_and_ending_positions.length - 1
        next_move = Move.find_by(name: dance_moves_and_ending_positions[0])
      else
        next_move = Move.find_by(name: dance_moves_and_ending_positions[index + 1])
      end

      # if this move's ending position is listed in the next moves list of possible start positions, we're good to go

      if next_move.positions.include?(position_this_move_ends_at)
        dance_move.assign_attributes(ending_position_id: position_this_move_ends_at.id)
      end

      dance_move.save
    end
  end
end

Seed.begin
