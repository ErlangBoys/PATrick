-type host() :: inet:ip_address() | inet:hostname().

-type connect_option() ::
    {database, DBName     :: string()}             |
    {port,     PortNum    :: inet:port_number()}   |
    {ssl,      IsEnabled  :: boolean() | required} |
    {ssl_opts, SslOptions :: [ssl:ssl_option()]}   | % @see OTP ssl app, ssl_api.hrl
    {timeout,  TimeoutMs  :: timeout()}            | % default: 5000 ms
    {async,    Receiver   :: pid() | atom()}       | % process to receive LISTEN/NOTIFY msgs
    {codecs,   Codecs     :: [{epgsql_codec:codec_mod(), any()}]} |
    {replication, Replication :: string()}. % Pass "database" to connect in replication mode
    
-spec connect(host(), string(), string(), [connect_option()] | map())
        -> {ok, Connection :: connection()} | {error, Reason :: connect_error()}.    


%% START / maybe it should be in another module 
connect(Host, Username, Password, Opts) -> 
      {ok, C} = epgsqla:start_link(),
    Ref = epgsqla:connect(C, "localhost", "username", "psss", [{database, "db_for_api_data"}]),
    receive
        {C, Ref, connected} ->
            {ok, C};
        {C, Ref, Error = {error, _}} ->
            Error;
        {'EXIT', C, _Reason} ->
            {error, closed}
    end.


%% END / maybe it should be in another module 


%% START / maybe it should be in another module 
-type query() :: string() | iodata().
-type squery_row() :: {binary()}.

-record(column, {
    name :: binary(),
    type :: epgsql_type(),
    size :: -1 | pos_integer(),
    modifier :: -1 | pos_integer(),
    format :: integer()
}).

-type ok_reply(RowType) ::
    {ok, ColumnsDescription :: [#column{}], RowsValues :: [RowType]} |                            % select
    {ok, Count :: non_neg_integer()} |                                                            % update/insert/delete
    {ok, Count :: non_neg_integer(), ColumnsDescription :: [#column{}], RowsValues :: [RowType]}. % update/insert/delete + returning
-type error_reply() :: {error, query_error()}.
-type reply(RowType) :: ok_reply() | error_reply().

-spec squery(connection(), query()) -> reply(squery_row()) | [reply(squery_row())].
%% @doc runs simple `SqlQuery' via given `Connection'
squery(Connection, SqlQuery) -> 
    epgsql:squery(C, "insert into account (name) values  ('alice'), ('bob')").

%% END / maybe it should be in another module 


%% START / maybe it should be in another module 
%% ENDa / maybe it should be in another module 
