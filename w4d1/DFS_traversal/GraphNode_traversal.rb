class GraphNode
    attr_accessor :val, :neighbors
  
    def initialize(val)
      self.val = val
      self.neighbors = []
    end
  end
  
  a = GraphNode.new('a')
  b = GraphNode.new('b')
  c = GraphNode.new('c')
  d = GraphNode.new('d')
  e = GraphNode.new('e')
  f = GraphNode.new('f')
  a.neighbors = [b, c, e]
  c.neighbors = [b, d]
  e.neighbors = [a]
  f.neighbors = [e]

#Depth-First search
# using GraphNode representation

def depth_first(node, visited = Set.new())
    # if this node has already been visited, then return early
    return nil if (visited.include?(node.val))
  
    # otherwise it hasn't yet been visited,
    # so print its val and mark it as visited.
    puts node.val
    visited.add(node.val)
  
    # then explore each of its neighbors
    node.neighbors.each do |neighbor|
      depth_first(neighbor, visited);
    end
  end
  
  depth_first(f)