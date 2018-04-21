-module(gelbooru_api).

-export([get_photo/1]).


%% Url for API access: /index.php?page=dapi&s=post&q=index
%% 
%% limit How many posts you want to retrieve. There is a hard limit of 100 posts per request.
%% pid The page number.
%% tags The tags to search for. Any tag combination that works on the web site will work here. This includes all the meta-tags. See cheatsheet for more information.
%% cid Change ID of the post. This is in Unix time so there are likely others with the same value if updated at the same time.
%% id The post id.
%% json Set to 1 for JSON formatted response.
-record(gelbooru_schema, {url, path, query, limit, pid}).


get_photo(_Params) ->
    GConf = #gelbooru_schema{url = <<"https://gelbooru.com/">>,
			 path = <<"index.php">>,
			 query = <<"page=dapi&s=post&q=index&json=1">>,
			 limit = 100,
			 pid = 1
			    },
    
    URL = hackney:make_url(GConf#gelbooru_schema.url, GConf#gelbooru_schema.path, GConf#gelbooru_schema.query),
    {ok, _ResultCode, Result} = hackney:request(get, URL), 
    io:format("~p",Result).
			    
			     
%% case :hackney.get(url, [],[], [:with_body]) do
%%  {:ok, status, _headers, body} when status in 200..299 ->
%%    {:ok, Poison.decode!(body)}
%%  {:ok, status, headers, body} ->
%%    # we got some other http status, make it an error
%%    {:error, {:request, status, headers, body}}
%%  {:error, reason} ->
%%    # there was some other error, e.g. server is not available
%%    {:error, {:network, reason}}
%% end
