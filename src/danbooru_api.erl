-module(danbooru_api).

-export([get_photo/1]).
%%
%% Module danbooru_api implements a simple library for accessing Danbooru-based image
%% boards.
%% Source code of Moebooru is available at https://github.com/r888888888/danbooru
%% Default configurations are available for the following websites
%%	danbooru.donmai.us
%%

%% DanbooruDonmaiUsConfig preconfigured config for DanbooruDonmaiUs site
-record(danbooru_schema, {url = <<"https://danbooru.donmai.us">>,
			  path = <<"posts.json">>,
			  limit = <<"200">>,
			  page = <<"page">>,
			  pid, tag, md5, random, raw}).

get_photo({Pid,Tag}) ->
    DConf = #danbooru_schema{pid=Pid,
			     tag=Tag
			    },

    URL = hackney_url:make_url(DConf#danbooru_schema.url,
			       DConf#danbooru_schema.path,
			       [{<<"page">>, <<(DConf#danbooru_schema.page)/binary>>},
				{<<"limit">>, <<(DConf#danbooru_schema.limit)/binary>>},
				{<<"pid">>, <<(DConf#danbooru_schema.pid)/binary>>},
				{<<"tags">>, <<(DConf#danbooru_schema.tag)/binary>>}]),
    
    {ok, _ResultCode, _Result, ClientRef} = hackney:request(get, URL),
    {ok, BinaryResponse} = hackney:body(ClientRef,infinity),
    BinaryResponse.


%% Post contains native Danbooru data

%% response json struct {
%%	ID                  int         `json:"id"`
%%	CreatedAt           time.Time   `json:"created_at"`
%%	UploaderID          int         `json:"uploader_id"`
%%	Score               int         `json:"score"`
%%	Source              string      `json:"source"`
%%	Md5                 string      `json:"md5"`
%%	LastCommentBumpedAt interface{} `json:"last_comment_bumped_at"`
%%	Rating              string      `json:"rating"`
%%	ImageWidth          int         `json:"image_width"`
%%	ImageHeight         int         `json:"image_height"`
%%	TagString           string      `json:"tag_string"`
%%	IsNoteLocked        bool        `json:"is_note_locked"`
%%	FavCount            int         `json:"fav_count"`
%%	FileExt             string      `json:"file_ext"`
%%	LastNotedAt         interface{} `json:"last_noted_at"`
%%	IsRatingLocked      bool        `json:"is_rating_locked"`
%%	ParentID            interface{} `json:"parent_id"`
%%	HasChildren         bool        `json:"has_children"`
%%	ApproverID          interface{} `json:"approver_id"`
%%	TagCountGeneral     int         `json:"tag_count_general"`
%%	TagCountArtist      int         `json:"tag_count_artist"`
%%	TagCountCharacter   int         `json:"tag_count_character"`
%%	TagCountCopyright   int         `json:"tag_count_copyright"`
%%	FileSize            int         `json:"file_size"`
%%	IsStatusLocked      bool        `json:"is_status_locked"`
%%	FavString           string      `json:"fav_string"`
%%	PoolString          string      `json:"pool_string"`
%%	UpScore             int         `json:"up_score"`
%%	DownScore           int         `json:"down_score"`
%%	IsPending           bool        `json:"is_pending"`
%%	IsFlagged           bool        `json:"is_flagged"`
%%	IsDeleted           bool        `json:"is_deleted"`
%%	TagCount            int         `json:"tag_count"`
%%	UpdatedAt           string      `json:"updated_at"`
%%	IsBanned            bool        `json:"is_banned"`
%%	PixivID             interface{} `json:"pixiv_id"`
%%	LastCommentedAt     interface{} `json:"last_commented_at"`
%%	HasActiveChildren   bool        `json:"has_active_children"`
%%	BitFlags            int         `json:"bit_flags"`
%%	UploaderName        string      `json:"uploader_name"`
%%	HasLarge            bool        `json:"has_large"`
%%	TagStringArtist     string      `json:"tag_string_artist"`
%%	TagStringCharacter  string      `json:"tag_string_character"`
%%	TagStringCopyright  string      `json:"tag_string_copyright"`
%%	TagStringGeneral    string      `json:"tag_string_general"`
%%	HasVisibleChildren  bool        `json:"has_visible_children"`
%%	ChildrenIds         interface{} `json:"children_ids"`
%%	FileURL             string      `json:"file_url"`
%%	LargeFileURL        string      `json:"large_file_url"`
%%	PreviewFileURL      string      `json:"preview_file_url"`
%%}
