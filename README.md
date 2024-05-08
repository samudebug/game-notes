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