def convert_length(value:, from_unit:, to_unit:)
  units = { m: 1.0, ft: 3.28, in: 39.37 }

  (value / units[from_unit] * units[to_unit]).round(2)
end