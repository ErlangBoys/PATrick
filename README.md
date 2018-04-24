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
1> imageboards_api:get_photos_url({<<1>>,<<"loli">>},gelbooru).  # get_photo({Page_Number}, Tags, Board_Name)
[<<"https://simg3.gelbooru.com/images/02/a7/02a7f4a0b289bebd7a2ee9c1200b3b34.webm">>,
 <<"https://simg3.gelbooru.com/images/cb/76/cb76a6e11ee97a7577ef99039c08c30c.gif">>,
 <<"https://simg3.gelbooru.com/images/de/52/de52bcc63cbf5ba2e2039421a42bff34.jpeg">>,
 <<"https://simg3.gelbooru.com/images/59/a6/59a6ef063a617087d5b746539ee19800.jpeg">>,
 <<"https://simg3.gelboo"...>>,<<"https://simg3.ge"...>>,
 <<"https://simg"...>>,<<"https://"...>>,<<"http"...>>,
 <<...>>|...]
```

# Danbooru API Test

```sh
# Need Gold account to parse some photos
2> imageboards_api:get_photos_url({<<1>>,<<"loli">>},danbooru). # get_photo({Page_Number, Tags},Board_Name)
[<<"https://hijiribe.donmai.us/data/155d08c41c29a8235177e8e35395e13c.jpg">>,
 <<"https://hijiribe.donmai.us/data/8b769c55519cc711df4e96d2bd796d4c.jpg">>,
 <<"https://hijiribe.donmai.us/data/182b22c169b126ffb1b81f97e125db83.png">>,
 <<"https://hijiribe.donmai.us/data/0986e5ba8e3c366f4b4c489187ace302.png">>,
 {error,"get_photos_url maps:find error"},
 {error,"get_photos_url maps:find error"},
 <<"https://hijiribe.donmai.us/d"...>>,
 <<"https://hijiribe.donmai."...>>,
 {error,[...]},
 {error,...},
 <<...>>|...]

```

### YandeRe API Test

```sh
3> imageboards_api:get_photos_url({<<1>>,<<"loli">>}, yandere). # get_photo({Page_Number, Tags},Board_Name)
[<<"https://files.yande.re/image/39f741a9bf7913e9fb9083c7d2b7d09d/yande.re%20409121%20asanagi%20ass%20loli%20monster"...>>,
 <<"https://files.yande.re/image/6b9a9788a62cb472bed60339306ff5ba/yande.re%20409138%20ass%20breast_hold%20buruma"...>>,
 <<"https://files.yande.re/image/21766354cda2d6487714d3afb75d3881/yande.re%20409239%20aoi_masami%20fate_gran"...>>,
 <<"https://files.yande.re/image/5b37df3ac95b4aa10cac31e34a5bf404/yande.re%20409261%20ass%20bikini%20cam"...>>,
 <<"https://files.yande.re/image/94b99a703204e1fae2bacb4481fa1fab/yande.re%20409278%20anal%20animal_"...>>,
 <<"https://files.yande.re/i"...>>,
 <<"https://files.yande."...>>,<<"https://files.ya"...>>,
 <<"https://file"...>>,<<"https://"...>>,<<"http"...>>,
 <<...>>|...]
```

### Konachan API Test

```sh
4> imageboards_api:get_photos_url({<<1>>,<<"loli">>}, konachan). # get_photo({Page_Number, Tags},Board_Name)
[<<"https://konachan.com/image/8a74e4b05069425a9e725185f175cc87/Konachan.com%20-%20241537%20animal%20annin_doufu%20b"...>>,
 <<"https://konachan.com/image/7400934ad8ffab81f019fdcaf63f7b77/Konachan.com%20-%20241546%20blazblue%20ishii666%"...>>,
 <<"https://konachan.com/image/f5a2755d5f01c247f438c93d9ec28307/Konachan.com%20-%20241547%20blazblue%20ishii"...>>,
 <<"https://konachan.com/image/b27cffee28f638489e4270aeb669fa23/Konachan.com%20-%20241559%20animal%20bra"...>>,
 <<"https://konachan.com/image/ff67367025c251b0e7f011a6f37628b1/Konachan.com%20-%20241564%20barefoot"...>>,
 <<"https://konachan.com/image/e2f1e1628198c4f5cc7ac570e40bc754/Konachan.com%20-%20241613%20aqua"...>>,
 <<"https://konachan.com"...>>,<<"https://konachan"...>>,
 <<"https://kona"...>>,<<"https://"...>>,<<"http"...>>,
 <<...>>|...]
```

## Supported Boards

  * yande.re [API](https://yande.re/help/api)
  * konachan.com [API](https://konachan.com/help/api)
  * gelbooru.com [API](https://gelbooru.com/index.php?page=help&topic=dapi) and [cheatsheet](https://gelbooru.com/index.php?page=help&topic=cheatsheet)
  * danbooru.donmai.us [API](https://danbooru.donmai.us/wiki_pages/43568) and [cheatsheet](https://danbooru.donmai.us/wiki_pages/43049)
  * chan.sankakucomplex.com [API](https://chan.sankakucomplex.com/help/api)
  * idol.sankakucomplex.com [API](https://idol.sankakucomplex.com/help/api)

## Stack

* Erlang 20
* [rebar3](https://github.com/erlang/rebar3) 
* [Cowboy](https://github.com/ninenines/cowboy)
* [Telegram API](https://github.com/seriyps/pe4kin)
* [JSON](https://github.com/sile/jsone)
* [Postgres](https://github.com/epgsql/epgsql)
* [HTTP Requests](https://github.com/benoitc/hackney)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Vadim Romaniuk** - *Initial work* - [glicOne](https://github.com/RomaniukVadim)
* **Dmytro Kovbasa**  - [Dmytro-Kovbasa](https://github.com/Dmytro-Kovbasa)
* **Pavel Liferenko**  - [Pavel Liferenko](https://github.com/Liferenko)

See also the list of [contributors](https://github.com/ErlangBoys/PATrick/graphs/contributors) who participated in this project.

## License

This project is licensed under the Apache-2.0 - see the [LICENSE.md](LICENSE.md) file for details
