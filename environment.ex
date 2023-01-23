defmodule EnvList do
  def new() do list = [] end
  #Adds key-value pair at start of list O(1) complexity
  def add(map, key, value) do map = [{key, value}] ++ map end
  #Adds key-value pair at end of list O(n) complexity
  def add2(map, key, value) do map = map ++ [{key, value}] end
  def lookup(map, key) do map[key] end
  def remove(key, map) do map = {key, map[key]} -- map end

  def test() do
    test_list = EnvList.new()
    EnvList.add(test_list, :a, 1)
    EnvList.add(test_list, :b, 2)
    EnvList.lookup(test_list, b)
#    EnvList.remove(:b, test_list)

  end
end
