module Values
  DATE_FORMAT = '%-m/%-d/%Y'.freeze
  CITY_ACRONYMS = {
    'NYC' => 'New York City',
    'LA' => 'Los Angeles'
  }.freeze
  DMY = /\d{1,2}-\d{1,2}-\d{4}/
  YMD = /\d{4}-\d{1,2}-\d{1,2}/
end
