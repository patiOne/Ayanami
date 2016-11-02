# This file contains the 'hacks' which are written to prevent
# repeating the same code all over the place.

def __grab_parameters(method, bind)
  hash = {}

  method(method).parameters.each do |_, n|
    v = bind.local_variable_get(n)

    if v.is_a? Hash
      hash.merge! v
    else
      hash.merge! [[n, v]].to_h
    end
  end

  hash
end
