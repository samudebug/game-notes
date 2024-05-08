# Game Notes

A simple and agile app to take notes about your backlog.
It uses [IGDB](https://igdb.com) to fetch the games.

### Built with:
- [Flutter](https://flutter.dev/)

### Packages used:
- [Getx](https://pub.dev/packages/get)
- [Drift](https://pub.dev/packages/drift)
- [Cached Network Image](https://pub.dev/packages/cached_network_image)
- [Intl](https://pub.dev/packages/intl)

### Running the App
You need to have Flutter installed. You can install it following the tutorials [here](https://docs.flutter.dev/get-started/install).

Install dependencies using

```sh
flutter pub get
```

Follow the [Getting Started Guide](https://api-docs.igdb.com/#getting-started) from IGDB to get a client ID and a client secret, then create a .env file following the [example file](./env.example).

Run the app using

```sh
flutter run
```

NOTE: I haven't tested it on all platforms, but as far as I know, it shouldn't have any problem.

### Screenshots
<div style="display: flex; flex-direction: row;">
  <img src="https://github.com/samudebug/game-notes/assets/34324655/53a31233-0381-4a3d-9464-a52e86042489" height="400" />
  <img src="https://github.com/samudebug/game-notes/assets/34324655/e33a366d-2505-47de-95a0-f94c3077ad1b" height="400" />
  <img src="https://github.com/samudebug/game-notes/assets/34324655/1b7f3c85-9096-47e7-93ee-1e629bd76944" height="400" />
</div>
