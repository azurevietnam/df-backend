FactoryGirl.define do
  factory :place_bmt, class: Place do
    code 'BMV'
    name 'Buôn Ma Thuột'
    name_unsigned 'Buon Ma Thuot'
    is_domestic 1
    short_name 'BMT'
  end
  
  factory :place_sgn, class: Place do
    code 'SGN'
      name 'Hồ Chí Minh'
      name_unsigned 'Ho Chi Minh'
      is_domestic 1
      short_name 'HCM'
  end
end