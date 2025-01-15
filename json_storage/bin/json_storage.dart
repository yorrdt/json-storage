import 'package:json_storage/json_storage.dart';
import 'package:json_storage/src/json_storage.dart';

void main(List<String> arguments) {
  final JsonStorage jsonStorage = JsonStorage();

  jsonStorage.setValue('name', 'yorrdt');
  jsonStorage.setValue('age', 999);
  jsonStorage.setValue('isPetrolHead', true);
  jsonStorage.setValue('trash', <String>['some', 'string', 'trash', 'here']);

  print('keys: ${jsonStorage.keys}');
  print('values: ${jsonStorage.values}');

  print(jsonStorage.contains('name'));
  print(jsonStorage.getValue('age'));
}
