-module(moebooru_api).

-export([get_photo/1]).
%%
%% Package moebooru implements a simple library for accessing Moebooru-based image
%% boards.
%% Source code of Moebooru is available at https://github.com/moebooru/moebooru
%% Default configurations are available for the following websites
%%	yande.re
%%	konachan.com
%%

%% YandeReConfig preconfigured config for yande.re site
-record(yandeRe_schema, {url = <<"https://yande.re">>,
			 path =  <<"post.json">>,
			 passwordSalt = <<"choujin-steiner--%s--">>,
			 limit = <<"1000">>,
			 pageTag = <<"page">>
			}).

%% KonachanConfig preconfigured config for konachan.com site
-record(konachan_schema, {url =  <<"https://konachan.com">>,
			  path = <<"post.json">>,
			  passwordSalt = <<"So-I-Heard-You-Like-Mupkids-?--%s--">>,
			  limit = <<"1000">>,
			  pageTag = <<"page">>
			 }).


get_photo(Options) ->
    ok.



%% Post contains native Moebooru data
%% response json struct {
%%	ID                  int           `json:"id"`
%%	Tags                string        `json:"tags"`
%%	CreatedAt           int           `json:"created_at"`
%%	UpdatedAt           int           `json:"updated_at"`
%%	CreatorID           int           `json:"creator_id"`
%%	ApproverID          interface{}   `json:"approver_id"`
%%	Author              string        `json:"author"`
%%	Change              int           `json:"change"`
%%	Source              string        `json:"source"`
%%	Score               int           `json:"score"`
%%	Md5                 string        `json:"md5"`
%%	FileSize            int           `json:"file_size"`
%%	FileExt             string        `json:"file_ext"`
%%	FileURL             string        `json:"file_url"`
%%	IsShownInIndex      bool          `json:"is_shown_in_index"`
%%	PreviewURL          string        `json:"preview_url"`
%%	PreviewWidth        int           `json:"preview_width"`
%%	PreviewHeight       int           `json:"preview_height"`
%%	ActualPreviewWidth  int           `json:"actual_preview_width"`
%%	ActualPreviewHeight int           `json:"actual_preview_height"`
%%	SampleURL           string        `json:"sample_url"`
%%	SampleWidth         int           `json:"sample_width"`
%%	SampleHeight        int           `json:"sample_height"`
%%	SampleFileSize      int           `json:"sample_file_size"`
%%	JpegURL             string        `json:"jpeg_url"`
%%	JpegWidth           int           `json:"jpeg_width"`
%%	JpegHeight          int           `json:"jpeg_height"`
%%	JpegFileSize        int           `json:"jpeg_file_size"`
%%	Rating              string        `json:"rating"`
%%	IsRatingLocked      bool          `json:"is_rating_locked"`
%%	HasChildren         bool          `json:"has_children"`
%%	ParentID            interface{}   `json:"parent_id"`
%%	Status              string        `json:"status"`
%%	IsPending           bool          `json:"is_pending"`
%%	Width               int           `json:"width"`
%%	Height              int           `json:"height"`
%%	IsHeld              bool          `json:"is_held"`
%%	FramesPendingString string        `json:"frames_pending_string"`
%%	FramesPending       []interface{} `json:"frames_pending"`
%%	FramesString        string        `json:"frames_string"`
%%	Frames              []interface{} `json:"frames"`
%%	IsNoteLocked        bool          `json:"is_note_locked"`
%%	LastNotedAt         int           `json:"last_noted_at"`
%%	LastCommentedAt     int           `json:"last_commented_at"`
%%	FlagDetail          struct {
%%		PostID    int         `json:"post_id"`
%%		Reason    string      `json:"reason"`
%%		CreatedAt time.Time   `json:"created_at"`
%%		UserID    interface{} `json:"user_id"`
%%		FlaggedBy string      `json:"flagged_by"`
%%	} `json:"flag_detail"`
%%}

