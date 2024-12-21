-module(brigade_config).

-export([initialize/0, get_guanco_url/0]).

initialize() ->
    Url = case os:getenv("GUANCO_API_URL") of
        undefined -> 
            error_logger:error_msg("GUANCO_API_URL not set, terminating."),
            erlang:halt(1);
        Val -> Val
    end,
    ets:new(brigade_config, [named_table, public]),
    ets:insert(brigade_config, {guanco_url, Url}).

get_guanco_url() ->
    case ets:lookup(brigade_config, guanco_url) of
        [{guanco_url, Url}] -> Url;
        [] -> error_logger:error_msg("GUANCO_API_URL not set, terminating.")
    end.
