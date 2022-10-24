#GraphNode Class
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



#Adjacency Matrix

matrix = [
    #   A       B       C       D       E       F
      [true,  true,   true,   false,  true,   false], # A
      [false, true,   false,  false,  false,  false], # B
      [false, true,   true,   true,   false,  false], # C
      [false, false,  false,  true,   false,  false], # D
      [true,  false,  false,  false,  true,   false], # E
      [false, false,  false,  false,  true,   true]   # F
    ]

#Adjacency List

graph = {
    'a': ['b', 'c', 'e'],
    'b': [],
    'c': ['b', 'd'],
    'd': [],
    'e': ['a'],
    'f': ['e']
  }