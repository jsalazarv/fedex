require 'minitest/autorun'
require 'fedex'

class FedexTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Fedex::VERSION
  end
end
