# TODO: implement after adding tests

# class ActionParser
#   attr_accessor :valid_actions

#   def initialize(controller_name, action_name, controller_pairs={})
#     @controller_name = controller_name
#     @action_name = action_name
#     @controllers = controller_pairs
#   end

#   def active?
#     (controller_matches? and action_matches? and true) || false
#   end

#   def controller_matches?
#     @valid_actions = @controllers[@controller_name] || @controllers[@controller_name.to_sym]
#   end

#   def action_matches?
#     matches_all_actions? || single_action_matches?
#   end

#   def matches_all_actions?
#     @valid_actions == true
#   end

#   def single_action_matches?
#     [@action_name, @action_name.to_sym].each {|a| return true if @valid_actions.include?(a) }
#     false
#   end
# end
