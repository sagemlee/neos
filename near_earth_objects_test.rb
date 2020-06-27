require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test

  def test_it_exists
    assert_instance_of NearEarthObjects, NearEarthObjects.new('2019-03-30')
  end 

  def setup 
    @fake_parsed_data =
      {:links=>{:self=>"http://www.neowsapp.com/rest/v1/neo/3840793?api_key=eJUR8YdNMQEq7VN21qbCOyoldtRij0wn47ssJymX"},
    :id=>"3840793",
    :neo_reference_id=>"3840793",
    :name=>"(2019 GN1)",
    :nasa_jpl_url=>"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3840793",
    :absolute_magnitude_h=>25.6,
    :estimated_diameter=>
    {:kilometers=>{:estimated_diameter_min=>0.0201629919, :estimated_diameter_max=>0.0450858206},
      :meters=>{:estimated_diameter_min=>20.1629919443, :estimated_diameter_max=>45.0858206172},
      :miles=>{:estimated_diameter_min=>0.0125286985, :estimated_diameter_max=>0.0280150214},
      :feet=>{:estimated_diameter_min=>66.1515504905, :estimated_diameter_max=>147.9193637137}},
    :is_potentially_hazardous_asteroid=>false,
    :close_approach_data=>
    [{:close_approach_date=>"2019-03-30",
      :close_approach_date_full=>"2019-Mar-30 17:02",
      :epoch_date_close_approach=>1553965320000,
      :relative_velocity=>{:kilometers_per_second=>"7.2519918595", :kilometers_per_hour=>"26107.1706940629", :miles_per_hour=>"16221.9805904304"},
      :miss_distance=>{:astronomical=>"0.1035596482", :lunar=>"40.2847031498", :kilometers=>"15492302.788669334", :miles=>"9626470.5675074492"},
      :orbiting_body=>"Earth"}],
    :is_sentry_object=>false},
  {:links=>{:self=>"http://www.neowsapp.com/rest/v1/neo/3840868?api_key=eJUR8YdNMQEq7VN21qbCOyoldtRij0wn47ssJymX"},
    :id=>"3840868",
    :neo_reference_id=>"3840868",
    :name=>"(2019 GN3)",
    :nasa_jpl_url=>"http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3840868",
    :absolute_magnitude_h=>22.8,
    :estimated_diameter=>
    {:kilometers=>{:estimated_diameter_min=>0.0732073989, :estimated_diameter_max=>0.1636967205},
      :meters=>{:estimated_diameter_min=>73.2073989347, :estimated_diameter_max=>163.696720474},
      :miles=>{:estimated_diameter_min=>0.0454889547, :estimated_diameter_max=>0.1017163949},
      :feet=>{:estimated_diameter_min=>240.181762721, :estimated_diameter_max=>537.0627483999}},
    :is_potentially_hazardous_asteroid=>false,
    :close_approach_data=>
    [{:close_approach_date=>"2019-03-30",
      :close_approach_date_full=>"2019-Mar-30 09:17",
      :epoch_date_close_approach=>1553937420000,
      :relative_velocity=>{:kilometers_per_second=>"10.0672004068", :kilometers_per_hour=>"36241.9214644346", :miles_per_hour=>"22519.3205899427"},
      :miss_distance=>{:astronomical=>"0.3795051245", :lunar=>"147.6274934305", :kilometers=>"56773158.279284815", :miles=>"35277204.729027847"},
      :orbiting_body=>"Earth"}],
    :is_sentry_object=>false}
  end 

  def test_a_date_returns_a_list_of_neos
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    assert_equal '(2019 GD4)', results[:astroid_list][0][:name]
  end

  def test_largest_asteroid_diameter
    skip
     JSON.stubs(:map).returns([@fake_parsed_data])
  assert_equal 537, NearEarthObjects.largest_asteroid_diameter('2019-03-30')
  end 

  def test_total_number_of_astroids
    skip
    JSON.stubs(:count).returns([@fake_parsed_data.count])
    assert_equal 3, NearEarthObjects.total_number_of_asteroids('2019-03-30')
  end 

end
