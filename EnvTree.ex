defmodule EnvTree do
  def test() do

    test_tree = EnvTree.new()
    test_tree = add(nil, :h, 4)
    test_tree = add(test_tree, :a, 1)
    test_tree = add(test_tree, :q, 15)
    test_tree = remove(test_tree, :q)
    test_tree = leftmost(test_tree)
  end
  #create new empty tree
  def new() do {:node, :nil, :nil, :nil, :nil} end

  #adding a key-value pair to an empty tree ..
  def add(:nil, key, value) do {:node, key, value, :nil, :nil} end

  #Already existing keys are updated
  def add({:node, key, _, left, right}, key, value) do {:node, key, value, left, right}end

  #Tree traversal and updating left branch
  def add({:node, k, v, left, right}, key, value) when key < k do {:node, k, v, add(left, key, value), right} end
  #same thing but instead update the right banch
  def add({:node, k, v, left, right}, key, value) do {:node, k,v,left,add(right,key,value)} end

  #Element not found and cannot be found
  def lookup(:nil, _ ) do nil end
  def lookup({:node, key, value, _, _}, key) do {key, value} end
  def lookup({:node, k, _, left, _}, key) when key < k do lookup(left, key) end
  def lookup({:node, k, _, _, right}, key) do lookup(right, key) end

  #Element not found and cannot be removed
  def remove(nil, _) do nil end
  def remove({:node, key, _, nil, right}, key) do right end
  def remove({:node, key, _, left, nil}, key) do left end
  #find the leftmost element in right branch and replace the node.
  def remove({:node, key, _, left, right}, key) do {key, value, remainder} = leftmost(right); {:node, key, value, left, remainder} end

  #tree traversal and updating left branch
  def remove({:node, k, v, left, right}, key) when key < k do {:node, k, v, remove(left, key), right} end
  #tree traversal and updating right branch
  def remove({:node, k, v, left, right}, key) do {:node, k, v, left, remove(right, key)} end

#If a left branch is missing, just return the element and
#all its children on the right
  def leftmost({:node, key, value, nil, rest}) do {key, value, rest} end
  #If both branches exist -> Go left, until we're at the leftmost element
#and return this node
  def leftmost({:node, k, v, left, right}) do {key, value, children} = leftmost(left); {key, value, {:node, k, v, children, right}} end
end
