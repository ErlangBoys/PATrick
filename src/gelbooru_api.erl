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
-record(gelbooru_schema, {url = <<"https://gelbooru.com/">>,
			  path = <<"index.php">>,
			  page = <<"dapi">>,
			  s = <<"post">>,
			  q = <<"index">>,
			  json = <<"1">>,
			  limit = <<"1000">>,
			  pid, tag, id}).

get_photo({Pid,Tag}) ->
%%  hackney_url:qs([{<<"none">>,<<"pror">>},{<<"none">>,<<"por">>}]).  
%% <<"none=pror&none=por">>

    GConf = #gelbooru_schema{pid=Pid,
			     tag=Tag
			    },

    URL = hackney_url:make_url(GConf#gelbooru_schema.url,
			       GConf#gelbooru_schema.path,
			       [{<<"page">>, <<(GConf#gelbooru_schema.page)/binary>>},
				{<<"s">>, <<(GConf#gelbooru_schema.s)/binary>>},
				{<<"q">>, <<(GConf#gelbooru_schema.q)/binary>>},
				{<<"json">>, <<(GConf#gelbooru_schema.json)/binary>>},
				{<<"limit">>, <<(GConf#gelbooru_schema.limit)/binary>>},
				{<<"pid">>, <<(GConf#gelbooru_schema.pid)/binary>>},
				{<<"tags">>, <<(GConf#gelbooru_schema.tag)/binary>>}]),
    
    {ok, ResultCode, _ResultHeaders, ClientRef} = hackney:request(get, URL),
    case hackney:body(ClientRef,infinity) of
	{ok, BinaryResponse} ->
	    case jsone:try_decode(BinaryResponse) of
		{ok, DecodedJsonList, _BinNextValue} ->
		    DecodedJsonList;
		{error, Reason} ->
		    %% there was some other error, e.g. server is not available
		    {error, Reason}
	    end;
	{error, {closed, BinResp}} ->
	    {error,{closed, BinResp}};
	{error, Reason} ->
	    %% there was some other error, e.g. server is not available
	    {error, Reason}
	end.
%% end

%% response json struct {
%%	Directory    string      `json:"directory"`
%%	Hash         string      `json:"hash"`
%%	Height       int         `json:"height"`
%%	ID           int         `json:"id"`
%%	Image        string      `json:"image"`
%%	Change       int         `json:"change"`
%%	Owner        string      `json:"owner"`
%%	ParentID     interface{} `json:"parent_id"`
%%	Rating       string      `json:"rating"`
%%	Sample       bool        `json:"sample"`
%%	SampleHeight int         `json:"sample_height"`
%%	SampleWidth  int         `json:"sample_width"`
%%	Score        int         `json:"score"`
%%	Tags         string      `json:"tags"`
%%	Width        int         `json:"width"`
%%	FileURL      string      `json:"file_url"`
%%}
