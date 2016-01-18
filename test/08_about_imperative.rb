require_relative 'test_helper'

class AboutImpreative < Minitest::Test

  def test_can_make_decision_with_if_only
    results = []
    RxRuby::Observable.range(1,10)
      .flat_map {|x|
        RxRuby::Observable.if(
          lambda { return x.even? },
          RxRuby::Observable.just(x)
        )
      }
      .subscribe {|r| results.push(r) }

    assert_equal '246810', results.join
  end

  def test_can_make_decision_with_if_and_else
    results = []

    RxRuby::Observable.range(1,5)
      .flat_map_with_index {|x,i|
        RxRuby::Observable.if(
          -> { return x.even? },
          RxRuby::Observable.just(x),
          RxRuby::Observable.range(x, i)
        )
      }
      .subscribe {|r| results.push(r) }

    assert_equal '23445678', results.join
  end

  def test_we_can_makae_test_cases
    result = ''
    cases = {
      matt: RxRuby::Observable.just(1),
      erik: RxRuby::Observable.just(2),
      bart: RxRuby::Observable.just(3),
      wes: RxRuby::Observable.just(4),
    }

    RxRuby::Observable.just(:wes)
      .flat_map {|c|
        RxRuby::Observable.case(
          ->{ return c },
          cases
        )
      }
      .subscribe {|x| result = x }

    assert_equal 4, result
  end

  def test_can_also_have_default_case
    result = ''
    cases = {
      matt: RxRuby::Observable.just(1),
      erik: RxRuby::Observable.just(2),
      bart: RxRuby::Observable.just(3),
      wes: RxRuby::Observable.just(4),
    }

    RxRuby::Observable.just('RxJS')
      .flat_map {|x|
        RxRuby::Observable.case(
          -> { return x },
          cases,
          RxRuby::Observable.just(5)
        )
      }
      .subscribe {|x| result = x}

    assert_equal 5, result
  end

  def test_while_does_something_until_proven_false
    i = 0
    result = []

    source = RxRuby::Observable
             .while(
               -> { return (i += 1) < 3 },
               RxRuby::Observable.just(42)
              )
             .subscribe {|r| result.push(r) }

    assert_equal '4242', result.join
  end
end
