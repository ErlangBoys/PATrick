-module(sankaku_api).

-export([get_photo/1]).
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
			      pageTag = <<"page">>.

%% idol_sankaku_schema preconfigured config for Sankaku Idol site
-record(idol_sankaku_schema, {url = <<"https://iapi.sankakucomplex.com/">>,
			      path = <<"post/index.json">>,
			      passwordSalt = <<"choujin-steiner--%s--">>,
			      limit = <<"100">>,
			      userAgent = <<"SCChannelApp/3.0 (Android; idol)">>,
			      appkeySalt = <<"sankakuapp_%s_Z5NE9YASej">>,
			      pageTag = <<"page">>.
