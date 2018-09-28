## Note only improper and becket dances are handled

## For hard coding purposes, I will enter data like: %w(neighbor_swing) and the result will be ['neigbor_swing']. This will have to be converted to 'Neighbor Swing' on the Frontend

## Positions still need short lines down the hall positions, probably others too

class Seed
  def self.begin
    seed = Seed.new
    seed.populate_heartbeat_contra
  end

  def populate_all_positions ## r-orient refers to rightmost person facing up, s-orient refers to rightmost person facing down (shape of short wavy line shaped like R or S)
    positions = %w(
      improper
      improper_progressed
      becket
      opposite_becket
      side_of_set_with neighbor_ones_facing_up
      side_of_set_with neighbor_ones_facing_down

      long_lines_larks_facing_in_partner_on_same_side_ones_on_right
      long_lines_larks_facing_in_partner_on_same_side_ones_on_left
      long_lines_larks_facing_in_neighbor_on_same_side_ones_facing_down
      long_lines_larks_facing_in_neighbor_on_same_side_ones_facing_up
      long_lines_ravens_facing_in_partner_on_same_side_ones_on_right
      long_lines_ravens_facing_in_partner_on_same_side_ones_on_left
      long_lines_ravens_facing_in_neighbor_on_same_side_ones_facing_down
      long_lines_ravens_facing_in_neighbor_on_same_side_ones_facing_up

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
  end

  def populate_heartbeat_contra
    dance = Dance.create!(name: 'Heartbeat Contra', writer: 'Don Flaherty', is_becket: false)
    moves = %w(balance_the_ring
      petronella
      neigbor_swing
      ravens_right_shoulder_round_1.5
      partner_swing
      circle_left_3/4
      partner_balance
      california_twirl
    )

    ## Which positions do I need to hard code now? All.
    ## Which possible_move_start_positions do I need to hard code now? for each move, all possible_move_start_positions



    moves.each_with_index do |move_name, index|
      move = Move.create!(name: move_name)
      dance_move = DanceMove.create!(
        dance_id: dance.id,
        move_id: move.id,
        number_in_dance: index,
        ending_position_id:
      )
    end

end
