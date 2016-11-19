class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    unless node.nil?
      node.children << self
    end
  end

  def add_child(child_node)
    child_node.parent= self
  end

  def remove_child(child_node)
    raise "Node is not a child." unless @children.include?(child_node)
    @children.delete(child_node)
    child_node.parent= nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    @children.each do |child|
      current_value = child.dfs(target_value)
      return current_value if current_value
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current = queue.shift
      return current if current.value == target_value
      queue += current.children
    end
    nil 
  end





end
