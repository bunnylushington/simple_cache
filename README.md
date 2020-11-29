# Simple Cache

## Deprecated with Nitrogen

This version has been deprecated with use of Nitrogen in favor of [NitroCache](https://github.com/nitrogen/nitro_cache)

This is kept here for use with the book [Build it with Nitrogen](https://builditwithnitrogen.com).

## Information

This is a fork of [simple_cache](https://github.com/marcelog/simple_cache)
modified specifically for the needs of integration with the [Nitrogen Web
Framework](http://nitrogenproject.com).


The updated code now has a separate process to handle the expirations, which is
a regular gen_server. To start it, just do:

    simple_cache_expirer:start_link()

## Create a cache

    simple_cache:init(my_cache_name).

## Getting a key

The following call will lookup **my\_key** in the cache named **my\_cache\_name**, and on
a MISS will call the given **fun**, caching its result for **3600000** milliseconds.

    simple_cache:get(my_cache_name, 3600000, my_key, fun() ->
        io:format("This fun will be called on a cache miss~n"),
        timer:sleep(5000)
        this_value_will_be_cached
    end)

## Flushing the cache

    simple_cache:flush(my_cache_name).

## Flushing a key

    simple_cache:flush(my_cache_name, my_key).

# Differences:

Some of the notable modifications from the original version:

+ Requesting a key from a bucket if it has not yet been initialized will
  automatically instantiate that bucket.
+ Added a `cache_exists/1` function.
+ Added a `set/4' function.
