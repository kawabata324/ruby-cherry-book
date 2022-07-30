UNITS = { m: 1.00, ft: 3.28, in: 39.37 }

def convert_length(length_val, from:, to:)
  (length_val / UNITS[from] * UNITS[to]).round(2)
end