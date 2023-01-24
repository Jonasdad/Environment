defmodule EnvList do

  #Return empty list
  def new() do [] end
  #Add - 3 cases - Empty, Key found -> update value, Key not found insert
  def add([], key, value) do [{key, value}] end #if list is empty -> do {key, value}
  def add([h | t], key, value) do [h | add(t, key, value)] end #Traverse list recursively
  def add([{key, _}| t], key ,value) do [{key, value} | t] end #update key

  def lookup([], _) do nil end #key not present
  def lookup([{key, _} | t ], key) do {key, value} end #key found -> return key-value pair
  def lookup([_ | t], key) do lookup(t, key) end

  def remove([], _) do [] end #Remove from empty list -> Empty list, []
  def remove([{key, value} | t], key) do t end
  def remove([h | t], key) do [h | remove(t, key)]end
end
