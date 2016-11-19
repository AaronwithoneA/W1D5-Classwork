require_relative "00_tree_node"

class KnightPathFinder
  attr_accessor :move_tree

  def initialize(start_pos = [0,0])
    @start_pos = start_pos
    @move_tree = PolyTreeNode.new(start_pos)
    @visited_positions = [@start_pos]
    build_move_tree
  end

  def build_move_tree
    queue = [@move_tree]
    until queue.empty?
      current = queue.shift
      children = new_move_positions(current.value)
      children.each do |child|
        child_node = PolyTreeNode.new(child)
        current.add_child(child_node)
        @visited_positions += children
        queue << child_node
      end
    end
  end

  def valid_moves(pos)
    move_array = []
    x, y = pos
    a = [-2, -2, 2, 2, 1, 1, -1, -1]
    b = [1, -1, 1, -1, 2, -2, 2, -2]
    a.each_with_index do |num, i|
      x2 = x + num
      y2 = y + b[i]
      valid = x2 >= 0 && x2 <= 7 && y2 >=0 && y2<= 7
      move_array << [x2,y2] if valid
    end
    move_array
  end

  def new_move_positions(pos)
    moves = valid_moves(pos)
    moves -= @visited_positions
  end

  def find_path(end_pos)
    end_node = @move_tree.dfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(node)
    path = []
    current = node
    queue = [node]
    until current.parent == nil
      current = queue.shift
      queue << current.parent
      path << current.value
    end
    path.reverse
  end

end

if __FILE__ == $PROGRAM_NAME
  kpf = KnightPathFinder.new
  #p kpf.valid_moves([3,3])
  # p kpf.valid_moves([2,1])
  # p kpf.move_tree

  p kpf.find_path([7,6])
end
