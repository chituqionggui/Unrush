class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  Future<void> init() async {
    // No-op on Web for now. Data layer pending web support.
  }
}

