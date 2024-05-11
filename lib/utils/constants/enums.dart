// Variable type for storing data in local storage
enum KeyType { BOOL, INT, DOUBLE, STR }

enum ModType {
  TRENDING,
  RECOMMENDED,
  SLASHING,
  FIREARMS,
  THROWING,
  ENERGY;

  String get title {
    switch (this) {
      case TRENDING:
        return 'Trending';
      case RECOMMENDED:
        return 'Recommended';
      case SLASHING:
        return 'Slashing';
      case FIREARMS:
        return 'Firearms';
      case THROWING:
        return 'Throwing';
      case ENERGY:
        return 'Energy';
    }
  }
}
