#Depth-First search

graph = {
    'a': ['b', 'c', 'e'],
    'b': [],
    'c': ['b', 'd'],
    'd': [],
    'e': ['a'],
    'f': ['e']
  }

  def depth_first(graph)
    visited = Set.new()
    graph.keys.each do |node|
      _depth_first(node, graph, visited)
    end
  end
  
  def _depth_first(node, graph, visited)
    return nil if visited.include?(node.to_sym)
  
    puts node
    visited.add(node.to_sym)
  
    graph[node.to_sym].each do |neighbor|
      _depth_first(neighbor, graph, visited)
    end
  end
  
  depth_first(graph)



#   graph = {
#   'h': ['i', 'j'],
#   'i': [],
#   'j': ['k'],
#   'k': [],
#   'l': ['m'],
#   'm': []
# }

# depth_first(graph)
# # prints h, i, j, k, l, m