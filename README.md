
# Learn the Reactive Extensions for Ruby (RxRuby) with RxRuby Koans #

The Koans walk you along the path to enlightenment in order to learn [RxRuby](https://github.com/ReactiveX/RxRuby). The goal is to learn the RxRuby library. We also teach you culture. Testing is not just something we pay lip service to, but something we live. It is essential in your quest to learn and do great things in the library.

## Structure ##

The koans are broken out into areas by file, events are covered in about_events.rb, time is introduced in about_time.rb, etc. They are presented in order in the index.rb file.

Each koan builds up your knowledge of RxRuby and builds upon itself.

Some koans simply need to have the correct answer substituted for an incorrect one. Some, however, require you to supply your own answer. If you see the method __ (a double underscore) listed, it is a hint to you to supply your own code in order to make it work correctly.

## Installing Ruby ##

In order to run the koans you need Ruby installed. If you do not already have Ruby set up, please visit the
[Ruby](https://www.ruby-lang.org/en/) website to install Ruby.

To verify your installation, in your terminal window simply type:
```bash
$ ruby -v
```
Any response for Ruby with a version number greater than 2.0 **should be** fine.

## Installing the RxRuby Koans ##

To install the RxRuby Koans, download via Git and add the dependencies via bundle:
```bash
$ git clone https://github.com/fteem/RxRubyKoans.git
$ cd RxRubyKoans
[RxRubyKoans ]$ bundle install
```

## The Path to Enlightenment ##

You can run the tests by calling `rake` at your terminal window.
```bash
[RxRubyKoans] $ rake
```

## Warning

At the moment, all of the test are passing. I am looking for someone with good knowledge of RxRuby to review them. When the review is done, the tests will be fixed to work like a proper Koans test suite.

## Red, Green, Refactor ##

In test-driven development (TDD) the mantra has always been red: write a failing test and run it, green: make the test pass, and refactor: look at the code and see if you can make it any better.

With the koans, you will need to run the tests and see it fail (red), make the test pass (green), then take a moment and reflect upon the test to see what it is teaching you and improve the code to better communicate its intent (refactor).

The very first time you run it you will see the following output:
```bash
  Observable Streams
    1) simple subscription

  1) Observable Streams simple subscription:
     Error: expected 42 to equal undefined
```

You have come to the first error. You then open up the `about_streams.rb` file in your text editor and look at `simple subscription`:

```rb
def test_simple_subscription
  stream = RxRuby::Observable.just(42)
  stream.subscribe {|x| assert_equal(__, x) }
end
```

You then change `__` to `42` and run the tests again. You should now have fixed the error.

Before moving on, think about what you are learning.

In this specific case, ignore everything except the method name  and the parts inside the method. The goal is for you to see that if you pass a value to the proper assertion method method, it will either ensure it is true and continue on, or fail if in fact the statement is false.

## Note

These koans have been ripped off from [RxJSKoans](https://github.com/Reactive-Extensions/RxJSKoans)
and translated to Ruby. Ping me [@fteem](https://twitter.com/fteem) for any feedback, questions or complaints.

Also, there are some skipped tests in the code, due to missing methods in RxRuby.
If you think this is incorrect (or an error on my side), please open an issue.
