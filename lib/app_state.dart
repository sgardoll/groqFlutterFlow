import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _groqApiKey =
          await secureStorage.getString('ff_groqApiKey') ?? _groqApiKey;
    });
    await _safeInitAsync(() async {
      _chatHistory =
          await secureStorage.getStringList('ff_chatHistory') ?? _chatHistory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _groqApiKey = '';
  String get groqApiKey => _groqApiKey;
  set groqApiKey(String value) {
    _groqApiKey = value;
    secureStorage.setString('ff_groqApiKey', value);
  }

  void deleteGroqApiKey() {
    secureStorage.delete(key: 'ff_groqApiKey');
  }

  List<String> _chatHistory = [];
  List<String> get chatHistory => _chatHistory;
  set chatHistory(List<String> value) {
    _chatHistory = value;
    secureStorage.setStringList('ff_chatHistory', value);
  }

  void deleteChatHistory() {
    secureStorage.delete(key: 'ff_chatHistory');
  }

  void addToChatHistory(String value) {
    chatHistory.add(value);
    secureStorage.setStringList('ff_chatHistory', _chatHistory);
  }

  void removeFromChatHistory(String value) {
    chatHistory.remove(value);
    secureStorage.setStringList('ff_chatHistory', _chatHistory);
  }

  void removeAtIndexFromChatHistory(int index) {
    chatHistory.removeAt(index);
    secureStorage.setStringList('ff_chatHistory', _chatHistory);
  }

  void updateChatHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    chatHistory[index] = updateFn(_chatHistory[index]);
    secureStorage.setStringList('ff_chatHistory', _chatHistory);
  }

  void insertAtIndexInChatHistory(int index, String value) {
    chatHistory.insert(index, value);
    secureStorage.setStringList('ff_chatHistory', _chatHistory);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
