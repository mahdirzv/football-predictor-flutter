enum Flavor {
  prod,
  qa,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'FP_PROD';
      case Flavor.qa:
        return 'FP_QA';
      case Flavor.dev:
        return 'FP_DEV';
      default:
        return 'title';
    }
  }

  static List<String> get availableLocations {
    switch (appFlavor) {
      case Flavor.prod:
        return ["gb"];
      case Flavor.qa:
        return ["gb", "us", "pl", "ie", "mt"];
      case Flavor.dev:
        return ["gb", "us", "pl", "ie", "mt"];
      default:
        return List.empty();
    }
  }
}
