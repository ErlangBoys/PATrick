%% Common test of database server
%% source: http://erlang.org/doc/apps/common_test/example_chapter.html

-module(db_data_type_SUITE).

-include_lib("eunit/include/eunit.hrl").
-include_lib("common_test/include/ct.hrl").
-include("epgsql.hrl").

connect_test(Module) ->
    connect_only(Module, []).

connect_to_db_test(Module) ->
    connect_only(Module, [{database, "db_for_api_data"}]).

 %% Test server callbacks
%% -export([suite/0, all/0, 
%%     init_per_suite/1, end_per_suite/1,
%%     init_per_testcase/2, end_per_testcase/2]).

%% Test cases
%% -export([string/1, integer/1]).
%% -define(CONNECT_STR, "DSN=sqlserver;UID=alladin;PWD=sesame"). %% TODO change DSN UID PWD
