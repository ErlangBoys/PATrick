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
