-module(simple_cache_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    application:start(nitro_cache),
    erlias:build(nitro_cache, simple_cache),
    {ok, {{one_for_one, 5, 10}, []}}.
