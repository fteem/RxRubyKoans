require_relative "test_helper"

class AboutMapping < Minitest::Test

  def test_flat_map_can_be_cartesian_product
    results = []
    RxRuby::Observable.range(1, 3)
      .flat_map {|x, i| RxRuby::Observable.of(x+1) }
      .subscribe {|r| results.push(r) }

    assert_equal '234', results.join
  end

  def test_flat_map_latest_only_gets_the_latest_value
    skip "Flat Map latest doesnt exist"
    # FIXME
    results = []
    puts (RxRuby::Observable.range(1,3).methods - Object.methods).sort

    RxRuby::Observable.range(1,3)
      .flat_map {|x| RxRuby::Observable.range(x, 1) }
      .subscribe {|x| results.push(x) }

    assert_equal '12345', results.join
  end

end
