-module(brigade_agent).
-behaviour(gen_server).

%% API
-export([start_link/1, execute_task/2]).
%% Callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

%% Public API
start_link(AgentId) ->
    gen_server:start_link({local, {brigade_agent, AgentId}}, ?MODULE, AgentId, []).

execute_task(AgentId, Task) ->
    gen_server:call({brigade_agent, AgentId}, {execute, Task}).

%% gen_server callbacks
init(AgentId) ->
    %% Initialize the agent with the given AgentId, initial state is 'idle'
    {ok, #{id => AgentId, state => idle}}.

handle_call({execute, Task}, _From, State) ->
    %% Replace this with actual task execution logic
    Result = io:format("Agent ~p executing task ~p~n", [State#{id}, Task]),
    %% Update the state to reflect the task is being executed
    NewState = State#{state => executing},
    {reply, {ok, Result}, NewState};

handle_call(_Request, _From, State) ->
    %% Handle unexpected calls
    {reply, error, State}.

handle_cast(_Msg, State) ->
    %% Handle cast messages (currently no specific logic for casts)
    {noreply, State}.

handle_info(_Info, State) ->
    %% Handle generic info messages (currently no specific logic)
    {noreply, State}.

terminate(_Reason, _State) ->
    %% Cleanup resources if needed before termination
    ok.

code_change(_OldVsn, State, _Extra) ->
    %% Handle version upgrades (if any)
    {ok, State}.

