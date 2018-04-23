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
 <<"https://simg3.gelbooru.com/images/cd/33/cd33d082c27d17f5f7f5be42c2254dae.jpeg">>,
 <<"https://simg3.gelbooru.com/images/52/08/5208851cf3c987e65c930f3eef39878e.jpeg">>,
 <<"https://simg3.gelbooru.com/images/02/c3/02c367f3eab8df69a0258784790582de.jpeg">>,
 <<"https://simg3.gelbooru.com/images/62/df/62dff5686c78f38f3ef77c483090318e.png">>,
 <<"https://simg3.gelbooru.com/images/ce/c3/cec34eed8337efaf7ca52ff16164f098.jpeg">>,
 <<"https://simg3.gelbooru.com/images/1d/e8/1de83da852d242fdd5f18ff3121a4014.jpe"...>>,
 <<"https://simg3.gelbooru.com/images/8f/82/8f823ed2969d32a6623ee442a6951063"...>>,
 <<"https://simg3.gelbooru.com/images/9a/9f/9a9fba93e5395aef4cb1ef23f2b0"...>>,
 <<"https://simg3.gelbooru.com/images/c5/52/c5529fbe8056aea9b84d4a0d"...>>,
 <<"https://simg3.gelbooru.com/images/d5/45/d545538c0dfc1c6124b3"...>>,
 <<"https://simg3.gelbooru.com/images/9e/aa/9eaa80442c3ba02b"...>>,
 <<"https://simg3.gelbooru.com/images/47/5a/475a9c2156dc"...>>,
 <<"https://simg3.gelbooru.com/images/7a/9f/7a9fdae8"...>>,
 <<"https://simg3.gelbooru.com/images/7c/c4/7cc4"...>>,
 <<"https://simg3.gelbooru.com/images/8e/d3/"...>>,
 <<"https://simg3.gelbooru.com/images/c1"...>>,
 <<"https://simg3.gelbooru.com/image"...>>,
 <<"https://simg3.gelbooru.com/i"...>>,
 <<"https://simg3.gelbooru.c"...>>,
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
 <<"https://hijiribe.donmai.us/data/9ae81cbb705c063eed2ba3340a280aa8.jpg">>,
 <<"https://hijiribe.donmai.us/data/179bf506a4cb9872ac6314dba78fa633.jpg">>,
 <<"https://hijiribe.donmai.us/data/a13b877771e382f4b956faf72a97ac9f.jpg">>,
 <<"https://hijiribe.donmai.us/data/73e791fae4e9e3a9ae97b8c2969b31c3.jpg">>,
 <<"https://hijiribe.donmai.us/data/668c0e5ccd85f54f72fa2ec8f63cbf05.jpg">>,
 {error,"get_photos_url maps:find error"},
 <<"https://hijiribe.donmai.us/data/4ab4638f1f36d13534ed89399b305e0b.jpg">>,
 <<"https://hijiribe.donmai.us/data/34986fc3655a33895573cc1ff0016586.jpg">>,
 <<"https://hijiribe.donmai.us/data/182b22c169b126ffb1b81f97e125db83.png">>,
 <<"https://hijiribe.donmai.us/data/0986e5ba8e3c366f4b4c489187ace302.png">>,
 {error,"get_photos_url maps:find error"},
 <<"https://hijiribe.donmai.us/data/3b2b9e6bf98cf3b763c7f640f68c"...>>,
 <<"https://hijiribe.donmai.us/data/4b9e5fa2ff09ddac7f8937c5"...>>,
 <<"https://hijiribe.donmai.us/data/046e2a63c75471798c70"...>>,
 <<"https://hijiribe.donmai.us/data/bd74e68b01652996"...>>,
 <<"https://hijiribe.donmai.us/data/6cb661ce391c"...>>,
 <<"https://hijiribe.donmai.us/data/ef042739"...>>,
 {error,"get_photos_url maps:find error"},
 {error,"get_photos_url maps:find error"},
 <<"https://hijiribe.donmai.us/d"...>>,
 <<"https://hijiribe.donmai."...>>,
 {error,"get_photos_url maps:find error"},
 {error,"get_photos_url maps:find error"},
 {error,"get_photos_url maps:find error"},
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
 <<"https://files.yande.re/image/0c695797445348a7c0dd8d5f22f89180/yande.re%20409308%20anal%20ani"...>>,
 <<"https://files.yande.re/image/4fda05241ea328e6285105c8f4d1608b/yande.re%20409356%20bikini"...>>,
 <<"https://files.yande.re/image/c5135cae51eda7aa7d58bec808c14937/yande.re%20409381%20ga"...>>,
 <<"https://files.yande.re/image/989c6cbf8d5b941a2b5dde8769766b88/yande.re%20409386%"...>>,
 <<"https://files.yande.re/image/c252439941491b03cae6d01ece88c08d/yande.re%20409"...>>,
 <<"https://files.yande.re/image/6671aab6af6a1d5e31fdce4bcfae46e9/yande.re%2"...>>,
 <<"https://files.yande.re/image/b77327dab797f135a4deabf925f43888/yande."...>>,
 <<"https://files.yande.re/image/5f3762be48d732b8597dc04429375dbb/ya"...>>,
 <<"https://files.yande.re/image/6ae0613964bc0ce0f6b74e8ee199be1"...>>,
 <<"https://files.yande.re/image/a7e7279d9945b1d9762a1907549"...>>,
 <<"https://files.yande.re/image/c2f9bb2b697dd56aa9945e2"...>>,
 <<"https://files.yande.re/image/271e8f8a27625cf9524"...>>,
 <<"https://files.yande.re/image/bf433811e47113b"...>>,
 <<"https://files.yande.re/image/4a1d82a6414"...>>,
 <<"https://files.yande.re/image/904265e"...>>,
 <<"https://files.yande.re/image/267"...>>,
 <<"https://files.yande.re/image"...>>,
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
 <<"https://konachan.com/image/7ca416dea47de106dbe4eff00424b61d/Konachan.com%20-%20241626%20"...>>,
 <<"https://konachan.com/image/27514102b7f2c52768d13f6b10dd9c1b/Konachan.com%20-%2024163"...>>,
 <<"https://konachan.com/image/6b78625f77ea871d71caef1a1e6f114b/Konachan.com%20-%202"...>>,
 <<"https://konachan.com/image/016d32a57612dc1ee33f955e47610c38/Konachan.com%20-"...>>,
 <<"https://konachan.com/image/38846a71ddc9abefba0d36aefc77ac19/Konachan.com"...>>,
 <<"https://konachan.com/image/51bbfa6f7e9f86158368bbb356a62c9d/Konachan"...>>,
 <<"https://konachan.com/image/3cdfdcce883e2651cdb620eefb26d269/Kona"...>>,
 <<"https://konachan.com/image/68f9b0ce609f01e332894bf1363f90b4/"...>>,
 <<"https://konachan.com/image/7095dc3a3a1154944724b38a936b7"...>>,
 <<"https://konachan.com/image/b5d3585bdb5217ee53aec0a68"...>>,
 <<"https://konachan.com/image/149a518955a587bf2a859"...>>,
 <<"https://konachan.com/image/528f3667048a61a41"...>>,
 <<"https://konachan.com/image/c59e9f101c794"...>>,
 <<"https://konachan.com/image/06224a7bd"...>>,
 <<"https://konachan.com/image/16d62"...>>,
 <<"https://konachan.com/image/b"...>>,
 <<"https://konachan.com/ima"...>>,
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
