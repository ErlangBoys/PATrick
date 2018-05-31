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

%% rule34 preconfigured schema for rule34.xxx site
-record(rule34_schema, {url = <<"https://rule34.xxx/">>,
			  path = <<"index.php">>,
			  page = <<"dapi">>,
			  s = <<"post">>,
			  q = <<"index">>,
			  json = <<"1">>,
			  limit = <<"1000">>,
			  pid, tag, id}).

%% realbooru.com preconfigured schema for realbooru.com site
-record(realbooru_schema, {url = <<"https://realbooru.com/">>,
			  path = <<"index.php">>,
			  page = <<"dapi">>,
			  s = <<"post">>,
			  q = <<"index">>,
			  json = <<"1">>,
			  limit = <<"1000">>,
			  pid, tag, id}).


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
			get_maps_from_jsone_response({Page,Tags},chan);
		    rule34 ->
			get_maps_from_jsone_response({Page,Tags},rule34);
		    realbooru ->
			get_maps_from_jsone_response({Page,Tags},realbooru)
		end,
    
    PhotoURL = case Board of
		   yandere ->
		       get_elements_from_list_of_maps(<<"file_url">>,  JsoneMaps);
		   konachan ->
		       get_elements_from_list_of_maps(<<"file_url">>,  JsoneMaps);
		   danbooru ->
		       get_elements_from_list_of_maps(<<"file_url">>,  JsoneMaps);
		   gelbooru ->
		       get_elements_from_list_of_maps(<<"file_url">>,  JsoneMaps);
		   idol_sankaku ->
		       get_elements_from_list_of_maps(<<"file_url">>,  JsoneMaps);
		   chan_sankaku ->
		       get_elements_from_list_of_maps(<<"file_url">>,  JsoneMaps);
		   rule34 ->
		       get_elements_from_list_of_maps(<<"image">>,  JsoneMaps);
		   realbooru ->
		       get_elements_from_list_of_maps(<<"image">>,  JsoneMaps)
	       end,
    PhotoURL.
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
					{<<"tags">>, <<(CConf#chan_sankaku_schema.tags)/binary>>}]);
	      rule34 ->
	    GConf = #rule34_schema{pid=Page,
				     tag=Tags},

	    hackney_url:make_url(GConf#rule34_schema.url,
				       GConf#rule34_schema.path,
				       [{<<"page">>, <<(GConf#rule34_schema.page)/binary>>},
					{<<"s">>, <<(GConf#rule34_schema.s)/binary>>},
					{<<"q">>, <<(GConf#rule34_schema.q)/binary>>},
					{<<"json">>, <<(GConf#rule34_schema.json)/binary>>},
					{<<"limit">>, <<(GConf#rule34_schema.limit)/binary>>},
					{<<"pid">>, <<(GConf#rule34_schema.pid)/binary>>},
					{<<"tags">>, <<(GConf#rule34_schema.tag)/binary>>}]);
	      realbooru ->
	    GConf = #realbooru_schema{pid=Page,
				     tag=Tags},

	    hackney_url:make_url(GConf#realbooru_schema.url,
				       GConf#realbooru_schema.path,
				       [{<<"page">>, <<(GConf#realbooru_schema.page)/binary>>},
					{<<"s">>, <<(GConf#realbooru_schema.s)/binary>>},
					{<<"q">>, <<(GConf#realbooru_schema.q)/binary>>},
					{<<"json">>, <<(GConf#realbooru_schema.json)/binary>>},
					{<<"limit">>, <<(GConf#realbooru_schema.limit)/binary>>},
					{<<"pid">>, <<(GConf#realbooru_schema.pid)/binary>>},
					{<<"tags">>, <<(GConf#realbooru_schema.tag)/binary>>}])
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

