-module(imageboards_api).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([get_photos_url/2]).

%% Danbooru preconfigured url schema for danbooru.com site
-record(danbooru_schema, {url = <<"https://danbooru.donmai.us">>,
			  path = <<"posts.json">>,
			  limit = <<"200">>,
			  page, tags, md5, random, raw}).

%% gelbooru preconfigured schema for gelbooru.com site
-record(gelbooru_schema, {url = <<"https://gelbooru.com/">>,
			  path = <<"index.php">>,
			  page = <<"dapi">>,
			  s = <<"post">>,
			  q = <<"index">>,
			  json = <<"1">>,
			  limit = <<"1000">>,
			  pid, tag, id}).

%% Yandere preconfigured url schema for yande.re site
-record(yandeRe_schema, {url = <<"https://yande.re">>,
			 path =  <<"post.json">>,
			 passwordSalt = <<"choujin-steiner--%s--">>,
			 limit = <<"1000">>,
			 page, tags
			}).

%% Konachan preconfigured schema for konachan.com site
-record(konachan_schema, {url =  <<"https://konachan.com">>,
			  path = <<"post.json">>,
			  passwordSalt = <<"So-I-Heard-You-Like-Mupkids-?--%s--">>,
			  limit = <<"1000">>,
			  page, tags
			 }).
%% chan.sankaku preconfigured schema for Sankaku Chan site
-record(chan_sankaku_schema, {url = <<"https://capi.sankakucomplex.com/">>,
			      path = <<"post/index.json">>,
			      passwordSalt = <<"choujin-steiner--%s--">>,
			      limit = <<"100">>,
			      userAgent =  <<"SCChannelApp/3.0 (Android; black)">>,
			      appkeySalt = <<"sankakuapp_%s_Z5NE9YASej">>,
			      page, tags}).

%% idol.sankaku preconfigured schema for Sankaku Idol site
-record(idol_sankaku_schema, {url = <<"https://iapi.sankakucomplex.com/">>,
			      path = <<"post/index.json">>,
			      passwordSalt = <<"choujin-steiner--%s--">>,
			      limit = <<"100">>,
			      userAgent = <<"SCChannelApp/3.0 (Android; idol)">>,
			      appkeySalt = <<"sankakuapp_%s_Z5NE9YASej">>,
			      page, tags}).

%% Function to retreive all Values from List of maps
%%

-spec get_elements_from_list_of_maps(atom(), list(map())) -> list( <<>> ) .

get_elements_from_list_of_maps(Key,List) ->
    get_elements_from_list_of_maps(Key, List, []).

get_elements_from_list_of_maps(_Key,[],List_of_values) ->
    List_of_values;

get_elements_from_list_of_maps(Key,[H|T],List_of_values) ->
    Value = case maps:find(Key, H) of
		{ok,Result}->
	    Result;
	error ->
	    {error,"get_photos_url maps:find error"}
    end,
    get_elements_from_list_of_maps(Key,T,[Value|List_of_values]).
%%
%% Function to retreive all Values from List of maps

%% Main Function that return list of photos url in binary format
%%
-spec get_photos_url(tuple(),atom()) -> list( <<>> ).
get_photos_url({Page,Tags},Board) ->
    JsoneMaps = case Board of
		    yandere ->
			get_maps_from_jsone_response({Page,Tags},yandere);
		    konachan ->
			get_maps_from_jsone_response({Page,Tags},konachan);
		    danbooru ->
			get_maps_from_jsone_response({Page,Tags},danbooru);
		    gelbooru ->
			get_maps_from_jsone_response({Page,Tags},gelbooru);
		    idol_sankaku ->
			get_maps_from_jsone_response({Page,Tags},idol);
		    chan_sankaku ->
			get_maps_from_jsone_response({Page,Tags},chan)
		end,
    
    
    get_elements_from_list_of_maps(<<"file_url">>,  JsoneMaps).
%%
%% Main Function that return list of photos url in binary format

-spec get_maps_from_jsone_response(tuple(), atom()) -> list(map()).

get_maps_from_jsone_response({Page,Tags}, Board) ->
    URL = case Board of
	danbooru ->
	    DConf = #danbooru_schema{page=Page,
				     tags=Tags},

	    hackney_url:make_url(DConf#danbooru_schema.url,
				       DConf#danbooru_schema.path,
				       [{<<"page">>, <<(DConf#danbooru_schema.page)/binary>>},
					{<<"limit">>, <<(DConf#danbooru_schema.limit)/binary>>},
					{<<"tags">>, <<(DConf#danbooru_schema.tags)/binary>>}]);
    
	gelbooru ->
	    GConf = #gelbooru_schema{pid=Page,
				     tag=Tags},

	    hackney_url:make_url(GConf#gelbooru_schema.url,
				       GConf#gelbooru_schema.path,
				       [{<<"page">>, <<(GConf#gelbooru_schema.page)/binary>>},
					{<<"s">>, <<(GConf#gelbooru_schema.s)/binary>>},
					{<<"q">>, <<(GConf#gelbooru_schema.q)/binary>>},
					{<<"json">>, <<(GConf#gelbooru_schema.json)/binary>>},
					{<<"limit">>, <<(GConf#gelbooru_schema.limit)/binary>>},
					{<<"pid">>, <<(GConf#gelbooru_schema.pid)/binary>>},
					{<<"tags">>, <<(GConf#gelbooru_schema.tag)/binary>>}]);
    
	konachan ->
	    KConf = #konachan_schema{page=Page,
				     tags=Tags},

	    hackney_url:make_url(KConf#konachan_schema.url,
				       KConf#konachan_schema.path,
				       [{<<"page">>, <<(KConf#konachan_schema.page)/binary>>},
					{<<"limit">>, <<(KConf#konachan_schema.limit)/binary>>},
					{<<"tags">>, <<(KConf#konachan_schema.tags)/binary>>}]);
    
	yandere ->
	    YConf = #yandeRe_schema{page=Page,
				    tags=Tags},

	    hackney_url:make_url(YConf#yandeRe_schema.url,
				       YConf#yandeRe_schema.path,
				       [{<<"page">>, <<(YConf#yandeRe_schema.page)/binary>>},
					{<<"limit">>, <<(YConf#yandeRe_schema.limit)/binary>>},
					{<<"tags">>, <<(YConf#yandeRe_schema.tags)/binary>>}]);
	idol ->
	    IConf = #idol_sankaku_schema{page=Page,
					 tags=Tags},

	    hackney_url:make_url(IConf#idol_sankaku_schema.url,
				       IConf#idol_sankaku_schema.path,
				       [{<<"page">>, <<(IConf#idol_sankaku_schema.page)/binary>>},
					{<<"limit">>, <<(IConf#idol_sankaku_schema.limit)/binary>>},
					{<<"tags">>, <<(IConf#idol_sankaku_schema.tags)/binary>>}]);
	chan ->
	    CConf = #chan_sankaku_schema{page=Page,
					 tags=Tags},

	    hackney_url:make_url(CConf#chan_sankaku_schema.url,
				       CConf#chan_sankaku_schema.path,
				       [{<<"page">>, <<(CConf#chan_sankaku_schema.page)/binary>>},
					{<<"limit">>, <<(CConf#chan_sankaku_schema.limit)/binary>>},
					{<<"tags">>, <<(CConf#chan_sankaku_schema.tags)/binary>>}])
    end,
    
    {ok, ResultCode, _Result, ClientRef} = hackney:request(get, URL),
    decode_json(ResultCode, ClientRef).

	    


decode_json(ResultCode, ClientRef) when ResultCode == 200 ->
    case hackney:body(ClientRef,infinity) of
	{ok, BinaryResponse} ->
	    case jsone:try_decode(BinaryResponse) of
		{ok, DecodedJsonList, _BinNextValue} ->
		    DecodedJsonList; %% maps
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

