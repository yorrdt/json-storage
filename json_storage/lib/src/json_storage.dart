import 'json_file.dart';

final class JsonStorage {
  static JsonStorage? _instance;
  final JsonFile _jsonFile;

  JsonStorage._internal(String path) : _jsonFile = JsonFile(path);

  factory JsonStorage([String path = 'json_storage.json']) {
    _instance ??= JsonStorage._internal(path);
    return _instance!;
  }

  Map<String, Object>? _values;

  String get path => _jsonFile.path;

  bool contains(String key) => _getValues().containsKey(key);

  List<String> get keys => List.unmodifiable(_getValues().keys);

  List<Object> get values => List.unmodifiable(_getValues().values);

  Object? getValue(String key) => _getValues()[key];

  Map<String, Object> _getValues() => _values ??= _jsonFile.read() ?? {};

  void setValue(String key, Object? value) async {
    if (value == null) {
      resetValue(key);
    }

    final values = Map.of(_getValues());
    final oldValue = values[key];
    values[key] = value!;

    if (oldValue == null) {
      _values = values;
      _jsonFile.write(values);
    }
  }

  void resetValue(String key) async {
    final values = Map.of(_getValues());
    if (values.remove(key) != null) {
      _values = values;
      _jsonFile.write(values);
    }
  }
}
