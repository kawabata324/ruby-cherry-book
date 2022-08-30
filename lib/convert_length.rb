UNITS = { m: 1.0, ft: 3.28, in: 39.37 }

def convert_length(value:, from_unit:, to_unit:)
  (value / UNITS[from_unit] * UNITS[to_unit]).round(2)
end