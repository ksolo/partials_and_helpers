def input_helper(type, name, id=nil, value=nil)
  input = "<input type='#{type}' name='#{name}'"
  input += " id='#{id}'" if id
  input += " value='#{value}'" if value
  input += ">"
  return input
end