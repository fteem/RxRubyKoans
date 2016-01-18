require_relative 'test_helper'
require 'event_emitter'

class FooEmitter
  include EventEmitter
end

class AboutEvents < Minitest::Test
  def test_the_main_event
    # FIXME
    skip "Event wrapping not available, yet."

    received = []
    e = FooEmitter.new

    subscription = RxRuby::Observable
                    .from_event(e, 'change')
                    .subscribe {|r| received.push(r) }

    e.emit('change', 'R')
    e.emit('change', 'x')
    e.emit('change', 'R')
    e.emit('change', 'u')
    e.emit('change', 'b')
    e.emit('change', 'y')

    subscription.dispose

    e.emit('change', '!')

    assert_equal "RxRuby", received.join('')
  end

end
