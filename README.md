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

### Rule34 API Test

```sh
5> imageboards_api:get_photos_url({<<1>>,<<"dragon_ball">>},rule34). 
[<<"3493a29d63d99677eab97151a2bf1f05.jpeg">>,
 <<"6ab50170c0406a5fd6f100cd583bf08a.jpeg">>,
 <<"f9e35620c5f81afdb213b499feff9ebb.jpeg">>,
 <<"62cae6366f4224080d452f40422e7550.png">>,
 <<"f9cc7a49118a1a9abc9f8c33ebbb1ee6.jpeg">>,
 <<"6b528af71e8e30c9f477f04192c7895b.jpeg">>,
 <<"d4e29b27d18d606e467f17dec009b2c6.png">>,
 <<"b5cc31bb2b2a30d5f092286878fc6bbf.jpeg">>,
 <<"32480121eb79d846911b94624698cdfa.jpeg">>,
 <<"775cfa0c6f695c5c26e6419804252830.jpeg">>,
 <<"e5b7e12d6e5d31701a3a78812752214e.jpeg">>,
 <<"08b3d036bfa62fa27ed8b8ed86fd94ce.jpeg">>,
 <<"2692f5569b3302035e78b23406a435756a73daed.png">>,
 <<"267dfc1b3ae74aa952f015d2c51b7b3cad26af93.png">>,
 <<"e88ebd42b304b97ff9a19ec74c5f0c17f4dba096.png">>,
 <<"f890c068823af4c23b2b4e5a6ed74295a860ed21.png">>,
 <<"d69ae6c985fd88003bf53d907a1d4b69.png">>,
 <<"822f211332c851010f6c4534206fc036.jpeg">>,
 <<"d0b697c3a28345d0126506be8383d8e1.jpeg">>,
 <<"e9f9bfb0dfc923f16e08c5cd75e59968.png">>,
 <<"1f79170453823bf141621ecb2c8ac2c9"...>>,
 <<"a4e4d866fae9b678c4c85ae93dfd"...>>,
 <<"68cf2e595124b1fb7bf0d9bd"...>>,
 <<"64f95c739337e40e8c1f"...>>,<<"93b9afa3bb3c1dd5"...>>,
 <<"d915f0ef3cde"...>>,<<"afcf7545"...>>,<<"e7db"...>>,
 <<...>>|...]

```

### Realbooru API Test

```sh
6>  imageboards_api:get_photos_url({<<1>>,<<"dragon_ball">>},realbooru).
[<<"fcb0c01578fcb35078141c5e0fdfca17c6994039.jpeg">>,
 <<"b41a9fe268b4de4d9782453b7d93fbf0a4c5f29e.jpeg">>,
 <<"2c9fa8e28aefd37028ba63243f319678ad4fe5e1.jpeg">>,
 <<"34769659cfcd626949f906d77961dcfe89deb970.jpg">>,
 <<"2f9da24299688909ca52ca5333e370a569cbba8c.jpg">>,
 <<"bf013d12d4cef9e541c10a3d07771cda64b38a2b.jpg">>,
 <<"b9092ec9e5c5b1cbe1b6dff80ab86490c839237d.jpg">>,
 <<"159b5549630dae2861afa5d5831106ca6d4f9677.jpg">>,
 <<"8b0ef7d62b4c0830bd2eed68e2a286f972b6bb55.jpg">>,
 <<"14d39389cb40b244fef1619928c41de3.webm">>,
 <<"fe4dbc16bbf3cc6bf122d6e66d4bce66.jpeg">>,
 <<"2286ac04860d806c24e842d918e04cb7.png">>]
```


## Supported Boards

  * yande.re [API](https://yande.re/help/api)
  * konachan.com [API](https://konachan.com/help/api)
  * gelbooru.com [API](https://gelbooru.com/index.php?page=help&topic=dapi) and [cheatsheet](https://gelbooru.com/index.php?page=help&topic=cheatsheet)
  * danbooru.donmai.us [API](https://danbooru.donmai.us/wiki_pages/43568) and [cheatsheet](https://danbooru.donmai.us/wiki_pages/43049)
  * chan.sankakucomplex.com [API](https://chan.sankakucomplex.com/help/api)
  * idol.sankakucomplex.com [API](https://idol.sankakucomplex.com/help/api)
  * realbooru.com [API](https://realbooru.com/index.php?page=help&topic=dapi)
  * rule34.xxx [API](https://rule34.xxx/index.php?page=help&topic=dapi)
  
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
