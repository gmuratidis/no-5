# frozen_string_literal: true

def a_number(min: 1, max: 100, approx: nil, except: [], jitter: 1)
  raise ArgumentError, 'jitter cannot cause approx to be less than 1' if approx.present? && approx - jitter < 1
  raise ArgumentError, 'minimum cannot exceed maximum' if min > max

  (((approx ? approx - jitter : min)..(approx ? approx + jitter : max)).to_a - [*except]).sample
end

def a_string(length: 16)
  SecureRandom.alphanumeric length
end
