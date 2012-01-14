def hashify keys, values
  hash = {}
  keys.each_with_index do |key, index|
    hash[key] = values[index]
  end
  return hash
end



def arrayify hash
  keys = []
  values = []
  hash.keys.each do |key| 
    keys.push key
    values.push hash[key]
  end
  return keys, values
end
