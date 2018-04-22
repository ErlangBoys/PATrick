# PATrick

[![Build Status](https://api.travis-ci.org/repos/ErlangBoys/PATrick/cc.xml?branch=dev)](https://travis-ci.org/ErlangBoys/PATrick)

Erlang administration tool for anime telegram channel

This repository created for automate routine job in anime channels, for example downloading and posting photo/gif from image boards.
Maybe downloading and posting content from other telegram channels in future.

## Usage

```sh
$ ./rebar3 tree  # Download deps
$ ./rebar3 compile # Compile project
$ ./rebar3 shell

# Gelbooru API Test

1> gelbooru_api:get_photo({<<"1">>,<<"loli">>}). # get_photo(Page_Number, Tags)
<<"[{\"source\":\"http:\\/\\/www.nijie.info\\/view.php?id=258736\",\"directory\":\"f5\\/f6\",\"hash\":\"f5f6f26474d41e0bac980679aa0d36"...>>

# Danbooru API Test

2> danbooru_api:get_photo({<<"1">>,<<"loli">>}). # get_photo(Page_Number, Tags)
<<"[{\"id\":3096704,\"created_at\":\"2018-04-21T18:07:27.232-04:00\",\"uploader_id\":508240,\"score\":6,\"source\":\"https://pawoo.n"...>>

# YandeRe API Test

3> moebooru_api:get_yandere_photo({<<"1">>,<<"loli">>}).
<<"[{\"id\":447698,\"tags\":\"anus bosshi bottomless loli nipples no_bra pussy shirt_lift uncensored\",\"created_at\":152432052"...>>

# Konachan API Test

4> moebooru_api:get_konachan_photo({<<"1">>,<<"loli">>}).
<<"[{\"id\":263923,\"tags\":\"ass blue_eyes blush brown_hair chishima_mako erect_nipples fang game_cg loli piyodera_mucha sh"...>>


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
