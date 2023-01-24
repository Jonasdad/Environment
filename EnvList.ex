defmodule EnvList do

  def test() do
    list = EnvList.new()
    a = EnvList.add(list, :a, 1)
    b = EnvList.add(a, :b, 2)
    c = EnvList.add(b, :c, 3)
    EnvList.lookup(c, :c)
    d = EnvList.remove(c, :a)
    #IO.inspect(c = EnvList.add(b, :b, 18))
  end

  #Return empty list
  def new() do [] end
  #Add - 3 cases - Empty, Key found -> update value, Key not found insert
  def add([], key, value) do [{key, value}] end #if list is empty -> do {key, value}
  def add([{k, val}| t], key ,value) do
    if(k == key) do #If matching keys -> update value
        [{key, value} | t]
    else            #If not matching keys -> append old list onto new list.
      [{k, val}] ++ add(t, key, value)
    end
  end

  def lookup([], _) do nil end #key not present
  def lookup([{key, value} | t ], find_key) do
    if(key == find_key) do
      {key, value} #key found -> return key-value pair
    else
      lookup(t, key) #key not found, keep traversing
    end
  end

  def remove([], _) do [] end
  def remove([{key, value} | t], delete_key) do
    if(key != delete_key) do
      [{key, value}] ++ remove(t, delete_key)
    else
      remove(t, delete_key)
    end
  end
  # def remove([{key, value} | t], key) do t end
 # def remove([h | t], key) do [h | remove(t, key)]end
end
