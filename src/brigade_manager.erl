-module(brigade_manager).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%% Public API
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% Supervisor callbacks
init([]) ->
    %% Define the children (agents) that this supervisor will manage
    Children = [
        %% Define agent 1 as a child of the brigade_agent supervisor
        {a1, {brigade_agent, start_link, [a1]}, permanent, 5000, worker, [brigade_agent]}
    ],

    %% Define the supervision strategy
    {ok, {{one_for_one, 5, 10}, Children}}.

%% internal functions