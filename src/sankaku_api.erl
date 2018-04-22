-module(sankaku_api).

-export([get_chan_photo/1, get_idol_photo/1]).
%%
%% Module sankaku implements a simple library for accessing Sankakucomplex-based
%% image boards.
%% Default configurations are available for the following websites
%%	chan.sankakucomplex.com
%%	idol.sankakucomplex.com
%%

%% chan_sankaku_schema preconfigured config for Sankaku Chan site
-record(chan_sankaku_schema, {url = <<"https://capi.sankakucomplex.com/">>,
			      path = <<"post/index.json">>,
			      passwordSalt = <<"choujin-steiner--%s--">>,
			      limit = <<"100">>,
			      userAgent =  <<"SCChannelApp/3.0 (Android; black)">>,
			      appkeySalt = <<"sankakuapp_%s_Z5NE9YASej">>,
			      page, tags}).

%% idol_sankaku_schema preconfigured config for Sankaku Idol site
-record(idol_sankaku_schema, {url = <<"https://iapi.sankakucomplex.com/">>,
			      path = <<"post/index.json">>,
			      passwordSalt = <<"choujin-steiner--%s--">>,
			      limit = <<"100">>,
			      userAgent = <<"SCChannelApp/3.0 (Android; idol)">>,
			      appkeySalt = <<"sankakuapp_%s_Z5NE9YASej">>,
			      page, tags}).


get_chan_photo({Page,Tags}) ->
    CConf = #chan_sankaku_schema{page=Page,
				 tags=Tags
				},

    URL = hackney_url:make_url(CConf#chan_sankaku_schema.url,
			       CConf#chan_sankaku_schema.path,
			       [{<<"page">>, <<(CConf#chan_sankaku_schema.page)/binary>>},
				{<<"limit">>, <<(CConf#chan_sankaku_schema.limit)/binary>>},
				{<<"tags">>, <<(CConf#chan_sankaku_schema.tags)/binary>>}]),
    
    {ok, _ResultCode, _Result, ClientRef} = hackney:request(get, URL),
    {ok, BinaryResponse} = hackney:body(ClientRef,infinity),
    BinaryResponse.

get_idol_photo({Page,Tags}) ->
    IConf = #idol_sankaku_schema{page=Page,
			     tags=Tags
			    },

    URL = hackney_url:make_url(IConf#idol_sankaku_schema.url,
			       IConf#idol_sankaku_schema.path,
			       [{<<"page">>, <<(IConf#idol_sankaku_schema.page)/binary>>},
				{<<"limit">>, <<(IConf#idol_sankaku_schema.limit)/binary>>},
				{<<"tags">>, <<(IConf#idol_sankaku_schema.tags)/binary>>}]),
    
    {ok, _ResultCode, _Result, ClientRef} = hackney:request(get, URL),
    {ok, BinaryResponse} = hackney:body(ClientRef,infinity),
    BinaryResponse.




%% response json struct {
%%	Width        int         `json:"width"`
%%	SampleWidth  int         `json:"sample_width"`
%%	FileSize     int         `json:"file_size"`
%%	IsFavorited  bool        `json:"is_favorited"`
%%	Status       string      `json:"status"`
%%	Rating       string      `json:"rating"`
%%	SampleHeight int         `json:"sample_height"`
%%	Md5          string      `json:"md5"`
%%	HasComments  bool        `json:"has_comments"`
%%	ParentID     interface{} `json:"parent_id"`
%%	HasChildren  bool        `json:"has_children"`
%%	Change       int         `json:"change"`
%%	HasNotes     bool        `json:"has_notes"`
%%	Source       string      `json:"source"`
%%	Author       string      `json:"author"`
%%	CreatedAt    struct {
%%		N         int    `json:"n"`
%%		JSONClass string `json:"json_class"`
%%		S         int    `json:"s"`
%%	} `json:"created_at"`
%%	FavCount     int `json:"fav_count"`
%%	Height       int `json:"height"`
%%	PreviewWidth int `json:"preview_width"`
%%	Tags         []struct {
%%		Type   int    `json:"type"`
%%		NameJa string `json:"name_ja"`
%%		Count  int    `json:"count"`
%%		Name   string `json:"name"`
%%		ID     int    `json:"id"`
%%	} `json:"tags"`
%%	RecommendedPosts interface{} `json:"recommended_posts"`
%%	SampleURL        string      `json:"sample_url"`
%%	FileURL          string      `json:"file_url"`
%%	ID               int         `json:"id"`
%%	PreviewHeight    int         `json:"preview_height"`
%%	PreviewURL       string      `json:"preview_url"`
%%	VoteCount        int         `json:"vote_count"`
%%	TotalScore       int         `json:"total_score"`
%%}
