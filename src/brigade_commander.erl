-module(brigade_commander).
-behaviour(supervisor).

%% API
-export([start_link/0, start_agent/1, stop_agent/1]).
%% Supervisor callbacks
-export([init/1]).

%% Public API
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

start_agent(AgentId) ->
    supervisor:start_child(?MODULE, [AgentId]).

stop_agent(AgentId) ->
    supervisor:terminate_child(?MODULE, {brigade_agent, AgentId}).

%% Supervisor callback
init(_Args) ->
    %% Start agent workers under the commander supervisor
    Children = [
        {brigade_agent, {brigade_agent, start_link, []}, permanent, 5000, worker, [brigade_agent]}
    ],
    {ok, {one_for_one, 5, 10, Children}}.
