# PATrick

[![Build Status](https://api.travis-ci.org/repos/ErlangBoys/PATrick.svg?branch=dev)](https://travis-ci.org/ErlangBoys/PATrick)

Erlang administration tool for anime telegram channel

This repository created for automate routine job in anime channels, for example downloading and posting photo/gif from image boards.
Maybe downloading and posting content from other telegram channels in future.

## Usage

```sh
$ ./rebar3 tree  # Download deps
$ ./rebar3 compile # Compile project
$ ./rebar3 shell
```

### Gelbooru API Test

```sh
1> gelbooru_api:get_photo({<<"1">>,<<"loli">>}). # get_photo(Page_Number, Tags)
[#{<<"change">> => 1522651836,
   <<"created_at">> => <<"Sun Apr 01 17:58:02 -0500 2018">>,
   <<"directory">> => <<"c5/26">>,
   <<"file_url">> =>
       <<"https://simg3.gelbooru.com/images/c5/26/c526e1d72a6799769db0a310a34c7529.jpeg">>,
   <<"hash">> => <<"c526e1d72a6799769db0a310a34c7529">>,
   <<"height">> => 1620,<<"id">> => 4171147,
   <<"image">> => <<"c526e1d72a6799769db0a310a34c7529.jpeg">>,
   <<"owner">> => <<"hinata_2-8">>,<<"parent_id">> => null,
   <<"rating">> => <<"e">>,<<"sample">> => true,
   <<"sample_height">> => 671,<<"sample_width">> => 850,
   <<"score">> => 0,<<"source">> => <<>>,
   <<"tags">> =>
       <<"1girl censored circle_anco loli old_man saku"...>>,
   <<"width">> => 2052},
 #{<<"change">> => 1522695139,
   <<"created_at">> => <<"Sun Apr 01 17:57:46 -0500 2018">>,
   <<"directory">> => <<"79/a7">>,
   <<"file_url">> =>
       <<"https://simg3.gelbooru.com/images/79/a7/79a71e5e5ccc8f9d238b56c712966a27.jpeg">>,
   <<"hash">> => <<"79a71e5e5ccc8f9d238b56c712966a27">>,
   <<"height">> => 1620,<<"id">> => 4171146,
   <<"image">> => <<"79a71e5e5ccc8f9d238b56c712966a27.jpeg">>,
   <<"owner">> => <<"hinata_2-8">>,<<"parent_id">> => null,
   <<"rating">> => <<"e">>,<<"sample">> => true,
   <<"sample_height">> => 671,<<"sample_width">> => 850,
   <<"score">> => 3,<<"source">> => <<>>,
   <<"tags">> =>
       <<"1girl ahegao boruto:_naruto_next_generat"...>>,
   <<"width">> => 2052}|...]
```

# Danbooru API Test

```sh
2> danbooru_api:get_photo({<<"1">>,<<"loli">>}). # get_photo(Page_Number, Tags)
[#{<<"up_score">> => 1,<<"has_large">> => true,
   <<"created_at">> => <<"2018-04-22T18:47:03.388-04:00">>,
   <<"last_noted_at">> => null,<<"pool_string">> => <<>>,
   <<"is_flagged">> => false,<<"pixiv_id">> => 68363051,
   <<"tag_count_character">> => 1,<<"tag_count">> => 44,
   <<"image_width">> => 915,
   <<"tag_string_meta">> => <<"highres">>,
   <<"is_banned">> => false,<<"image_height">> => 1280,
   <<"tag_count_artist">> => 1,<<"fav_count">> => 1,
   <<"approver_id">> => null,<<"tag_count_meta">> => 1,
   <<"tag_count_copyright">> => 1,
   <<"tag_count_general">> => 40,
   <<"has_active_children">> => false,
   <<"uploader_id">> => 348646,<<"bit_flags">> => 0,
   <<"keeper_data">> => #{<<"uid">> => 348646},
   <<"parent_id">> => null,<<"is_deleted">> => false,
   <<"is_pendi"...>> => false,<<"upda"...>> => <<"2018"...>>,
   <<...>> => <<...>>,...},
 #{<<"has_large">> => true,
   <<"created_at">> => <<"2018-04-22T11:37:24.067-04:00">>,
   <<"last_noted_at">> => null,<<"pool_string">> => <<>>,
   <<"is_flagged">> => false,<<"pixiv_id">> => 68360548,
   <<"tag_count_character">> => 1,<<"tag_count">> => 25,
   <<"image_width">> => 3543,
   <<"tag_string_meta">> => <<"absurdres highres revision">>,
   <<"is_banned">> => false,<<"image_height">> => 2480,
   <<"tag_count_artist">> => 1,<<"fav_count">> => 16,
   <<"approver_id">> => null,<<"tag_count_meta">> => 3,
   <<"tag_count_copyright">> => 2,
   <<"tag_count_general">> => 18,
   <<"has_active_children">> => true,
   <<"uploader_id">> => 30072,<<"bit_flags">> => 0,
   <<"keeper_data">> => #{<<"uid">> => 30072},
   <<"parent_id">> => 3097732,<<"is_deleted">> => false,
   <<"is_pendi"...>> => false,<<"upda"...>> => <<"2018"...>>,
   <<...>> => <<...>>,...}|...]
```

### YandeRe API Test

```sh
3> moebooru_api:get_yandere_photo({<<"1">>,<<"loli">>}).
[#{<<"last_commented_at">> => 0,
   <<"sample_url">> =>
       <<"https://files.yande.re/sample/872a46d7bc2732b5ae2cb549c20c47fc/yande.re%20448073%20sample%20ass%20bathin"...>>,
   <<"score">> => 31,<<"is_shown_in_index">> => true,
   <<"preview_height">> => 129,
   <<"file_url">> =>
       <<"https://files.yande.re/image/872a46d7bc2732b5ae2cb549c20c47fc/yande.re%20448073%20ass%20"...>>,
   <<"height">> => 1405,
   <<"md5">> => <<"872a46d7bc2732b5ae2cb549c20c47fc">>,
   <<"actual_preview_height">> => 258,
   <<"status">> => <<"active">>,
   <<"sample_file_size">> => 299676,<<"preview_width">> => 150,
   <<"created_at">> => 1524421357,<<"last_noted_at">> => 0,
   <<"jpeg_height">> => 1405,<<"author">> => <<"Mr_GT">>,
   <<"sample_width">> => 1393,<<"is_held">> => false,
   <<"change">> => 2363576,<<"frames_string">> => <<>>,
   <<"width">> => 1631,<<"approver_id">> => null,
   <<"frames_pending">> => [],<<"parent_id">> => null,
   <<"sample_heigh"...>> => 1200,<<"is_pendi"...>> => false,
   <<"tags">> => <<"ass "...>>,<<...>> => 1524422516,...},
 #{<<"sample_url">> =>
       <<"https://files.yande.re/sample/64b04162a998320d4379de024a391ade/yande.re%20447996%20sample%20loli%20love_"...>>,
   <<"score">> => 7,<<"is_shown_in_index">> => true,
   <<"preview_height">> => 150,
   <<"file_url">> =>
       <<"https://files.yande.re/image/64b04162a998320d4379de024a391ade/yande.re%20447996%20loli%2"...>>,
   <<"height">> => 4303,
   <<"md5">> => <<"64b04162a998320d4379de024a391ade">>,
   <<"actual_preview_height">> => 300,
   <<"status">> => <<"active">>,
   <<"sample_file_size">> => 83813,<<"preview_width">> => 52,
   <<"created_at">> => 1524417523,<<"last_noted_at">> => 0,
   <<"jpeg_height">> => 4303,<<"author">> => <<"Masutaniyan">>,
   <<"sample_width">> => 520,<<"is_held">> => false,
   <<"change">> => 2363224,<<"frames_string">> => <<>>,
   <<"width">> => 1492,<<"approver_id">> => null,
   <<"frames_pending">> => [],<<"parent_id">> => null,
   <<"sample_heigh"...>> => 1500,<<"is_pendi"...>> => false,
   <<"tags">> => <<"loli"...>>,<<...>> => 1524417533,...}|...]
```

### Konachan API Test

```sh
4> moebooru_api:get_konachan_photo({<<"1">>,<<"loli">>}).
[#{<<"frames_pending_string">> => <<>>,<<"rating">> => <<"s">>,
   <<"id">> => 263923,<<"frames">> => [],
   <<"jpeg_file_size">> => 229526,
   <<"sample_url">> =>
       <<"https://konachan.com/jpeg/ac55bcb21e5fbe0c25cc1f1a44198419/Konachan.com%20-%20263923%20a"...>>,
   <<"score">> => 57,<<"is_shown_in_index">> => true,
   <<"preview_height">> => 113,
   <<"file_url">> =>
       <<"https://konachan.com/image/ac55bcb21e5fbe0c25cc1f1a44198419/Konachan.com"...>>,
   <<"height">> => 768,
   <<"md5">> => <<"ac55bcb21e5fbe0c25cc1f1a44198419">>,
   <<"actual_preview_height">> => 225,
   <<"status">> => <<"active">>,<<"sample_file_size">> => 0,
   <<"preview_width">> => 150,<<"created_at">> => 1524298762,
   <<"jpeg_height">> => 768,
   <<"author">> => <<"BattlequeenYume">>,
   <<"sample_width">> => 1024,<<"is_held">> => false,
   <<"change">> => 1477884,<<"frames_string">> => <<>>,
   <<"width">> => 1024,<<"frames_pendi"...>> => [],
   <<"parent_i"...>> => null,<<"samp"...>> => 768,
   <<...>> => <<...>>,...},
 #{<<"rating">> => <<"q">>,<<"id">> => 263916,
   <<"frames">> => [],<<"jpeg_file_size">> => 0,
   <<"sample_url">> =>
       <<"https://konachan.com/sample/9ed41ca5007da75d16d41a45374e36d5/Konachan.com%20-%20263916%2"...>>,
   <<"score">> => 59,<<"is_shown_in_index">> => true,
   <<"preview_height">> => 84,
   <<"file_url">> =>
       <<"https://konachan.com/image/9ed41ca5007da75d16d41a45374e36d5/Konachan.com"...>>,
   <<"height">> => 1720,
   <<"md5">> => <<"9ed41ca5007da75d16d41a45374e36d5">>,
   <<"actual_preview_height">> => 169,
   <<"status">> => <<"active">>,
   <<"sample_file_size">> => 722151,<<"preview_width">> => 150,
   <<"created_at">> => 1524273294,<<"jpeg_height">> => 1720,
   <<"author">> => <<"gnarf1975">>,<<"sample_width">> => 1500,
   <<"is_held">> => false,<<"change">> => 1477647,
   <<"frames_string">> => <<>>,<<"width">> => 3058,
   <<"frames_pendi"...>> => [],<<"parent_i"...>> => null,
   <<"samp"...>> => 844,<<...>> => <<...>>,...}|...]
```

## Supported Boards

  * yande.re [API](https://yande.re/help/api)
  * konachan.com [API](https://konachan.com/help/api)
  * gelbooru.com [API](https://gelbooru.com/index.php?page=help&topic=dapi) and [cheatsheet](https://gelbooru.com/index.php?page=help&topic=cheatsheet)
  * danbooru.donmai.us [API](https://danbooru.donmai.us/wiki_pages/43568) and [cheatsheet](https://danbooru.donmai.us/wiki_pages/43049)
  * chan.sankakucomplex.com [API](https://chan.sankakucomplex.com/help/api)
  * idol.sankakucomplex.com [API](https://idol.sankakucomplex.com/help/api)

## Stack

```
Erlang 20
rebar3 
Cowboy
Telegram API (https://github.com/seriyps/pe4kin)
JSON (https://github.com/sile/jsone)
Postgres
HTTP Requests (hackney)
```

## Branches

### moebooru_api

    Api configurations are available for the following websites
    yande.re
    konachan.com

### sankaku

    API configurations are available for the following websites
    chan.sankakucomplex.com
    idol.sankakucomplex.com

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Vadim Romaniuk** - *Initial work* - [glicOne](https://github.com/RomaniukVadim)
* **Dmytro Kovbasa**  - [Dmytro-Kovbasa](https://github.com/Dmytro-Kovbasa)
* **Pavel Liferenko**  - [Pavel Liferenko](https://github.com/Liferenko)

See also the list of [contributors](https://github.com/ErlangBoys/PATrick/graphs/contributors) who participated in this project.

## License

This project is licensed under the Apache-2.0 - see the [LICENSE.md](LICENSE.md) file for details
