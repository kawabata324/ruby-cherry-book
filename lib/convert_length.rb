def convert_length(value, from_unit, to_unit)
  meter_value = case from_unit
                when 'm' then
                  value / 1
                when 'ft' then
                  value / 3.28
                when 'in' then
                  value / 39.37
                end
  puts meter_value

  changed_value = case to_unit
                  when 'm' then
                    meter_value * 1
                  when 'ft' then
                    meter_value * 3.28
                  when 'in' then
                    meter_value * 39.37
                  end

  changed_value.round(2)
end