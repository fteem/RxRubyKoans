require_relative 'test_helper'

class AboutAdvancedStreams < Minitest::Test

  def test_merging
    easy = []
    you = RxRuby::Observable.of(1,2,3)
    me = RxRuby::Observable.of('A', 'B', 'C')
    you.merge(me).subscribe {|item| easy.push(item) }

    assert_equal '12A3BC', easy.join
  end

  def test_merging_events
    first = []
    both = []

    subject_1 = RxRuby::Subject.new
    subject_2 = RxRuby::Subject.new

    subject_1_observable = subject_1.as_observable
    subject_2_observable = subject_2.as_observable

    subject_1_observable.subscribe {|item| first.push(item) }
    subject_1_observable.merge(subject_2_observable).subscribe {|item| both.push(item) }

    subject_1.on_next('I')
    subject_1.on_next('am')
    subject_2.on_next('nobody.')
    subject_2.on_next('Nobody')
    subject_2.on_next('is')
    subject_1.on_next('perfect.')

    assert_equal "I am nobody. Nobody is perfect.", both.join(' ')
    assert_equal "I am perfect.", first.join(' ')
  end

  def test_splitting_up
    skip 'Group by?'
    # FIXME
  end

  def test_need_to_subscribe_immediatelly_when_splitting
    skip 'Group by?'
    # FIXME
  end

  def test_multiple_subscriptions
    numbers = RxRuby::Subject.new
    numbers_obs = numbers.as_observable
    sum = 0
    average = 0

    numbers_obs.sum.subscribe {|n| sum = n }

    numbers.on_next(1)
    numbers.on_next(1)
    numbers.on_next(1)
    numbers.on_next(1)
    numbers.on_next(1)

    numbers_obs.average.subscribe {|n| average = n }

    numbers.on_next(2)
    numbers.on_next(2)
    numbers.on_next(2)
    numbers.on_next(2)
    numbers.on_next(2)

    numbers.on_completed

    assert_equal 15, sum
    assert_equal 2, average
  end

end
