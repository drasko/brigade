%%%-------------------------------------------------------------------
%% @doc brigade public API
%% @end
%%%-------------------------------------------------------------------

-module(brigade_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    brigade_config:initialize(),
    brigade_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
