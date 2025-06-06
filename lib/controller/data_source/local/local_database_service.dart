

import 'package:path_provider/path_provider.dart';
import '../../../objectbox.g.dart';

class LocalDatabaseService {

  static LocalDatabaseService? _instance;
  static LocalDatabaseService get instance => _instance!;

  late final Store _store;
  Store get store => _store;

  LocalDatabaseService._();

  factory LocalDatabaseService() {
    _instance ??= LocalDatabaseService._();
    return _instance!;
  }

  static Future<void> initialize() async {
    if (_instance != null) return;
    
    _instance = LocalDatabaseService._();
    await _instance!._init();
  }

  Future<void> _init() async {
    try {
      final docsDir = await getApplicationDocumentsDirectory();
      _store = await openStore(directory: '${docsDir.path}/objectbox');
      
      print('Database path: ${docsDir.path}/objectbox');
    } catch (e) {
      print('Error initializing ObjectBox: $e');
      rethrow;
    }
  }

  bool get isInitialized => _instance != null;

  void close() => _store.close();
  
}