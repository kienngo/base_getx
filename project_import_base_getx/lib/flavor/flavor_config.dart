enum Flavor { DEV, STG, PROD }

class FlavorConfig {
  static Flavor appFlavor = Flavor.DEV;

  static String get apiEndPoint {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'https://jsonplaceholder.typicode.com/';

      case Flavor.STG:
        return 'https://jsonplaceholder.typicode.com/';

      case Flavor.PROD:
        return 'https://jsonplaceholder.typicode.com/';
    }
  }

  static int get timeOut {
    return 30;
  }
}