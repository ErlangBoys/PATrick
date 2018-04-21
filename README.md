# PATrick
Erlang administration tool for anime telegram channel

This repository created for automate routine job in anime channels, for example downloading and posting photo/gif from image boards.
Maybe downloading and posting content from other telegram channels in future.

## Usage

```sh
$ ./rebar3 tree  # Download deps
$ ./rebar3 compile # Compile project
$ ./rebar3 shell
1> gelbooru_api:get_photo({<<"1">>,<<"loli">>}).
<<"[{\"source\":\"http:\\/\\/www.nijie.info\\/view.php?id=258736\",\"directory\":\"f5\\/f6\",\"hash\":\"f5f6f26474d41e0bac980679aa0d36"...>>

```

## Supported Boards

  * yande.re [API](https://yande.re/help/api)
  * konachan.com [API](https://konachan.com/help/api)
  * gelbooru.com [API](https://gelbooru.com/index.php?page=help&topic=dapi) and [cheatsheet](https://gelbooru.com/index.php?page=help&topic=cheatsheet)
  * danbooru.donmai.us [API](https://danbooru.donmai.us/wiki_pages/43568) and [cheatsheet](https://danbooru.donmai.us/wiki_pages/43049)
  * chan.sankakucomplex.com [API](https://chan.sankakucomplex.com/help/api)
  * idol.sankakucomplex.com [API](https://idol.sankakucomplex.com/help/api)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Vadim Romaniuk** - *Initial work* - [glicOne](https://github.com/RomaniukVadim)
* **Dmytro Kovbasa**  - [Dmytro-Kovbasa](https://github.com/Dmytro-Kovbasa)
* **Pavel Liferenko**  - [Pavel Liferenko](https://github.com/Liferenko)

See also the list of [contributors](https://github.com/ErlangBoys/PATrick/graphs/contributors) who participated in this project.

## License

This project is licensed under the Apache-2.0 - see the [LICENSE.md](LICENSE.md) file for details
