require_relative 'test_helper'

class AboutTime < Minitest::Test

  # Meh. Not really the same in RxJSKoans
  def test_launching_event_via_scheduler
    state = nil
    received = ''
    delay = 2 # seconds

    RxRuby::LocalScheduler.new.schedule_relative_with_state(state, delay, lambda {|scheduler, state| received = 'Finished'})

    assert_equal 'Finished', received
  end

  def test_launching_event_in_future
    received = nil
    time = 1 # seconds
    timeout = time + 1 # We need to sleep more then the delay.

    people = RxRuby::Subject.new
    people_obs = people.as_observable
    people_obs.delay(time).subscribe {|x| received = x }
    people.on_next('Godot')

    sleep timeout

    assert_equal 'Godot', received
  end

  def test_a_watched_pot
    skip "Timeout not implemented yet."
    received = ''
    delay = 1 # seconds
    timeout = 2 # seconds
    timeout_event = RxRuby::Observable.just("Tepid")

    RxRuby::Observable
      .just("Boiling")
      .delay(delay)
      .timeout(timeout, timeout_event)
      .subscribe {|x| received = x }

    sleep 3

    assert_equal "Boiling", received
  end
end
