// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hut/model/chat.dart';
// import 'package:hut/model/location.dart';
// import 'package:hut/model/user.dart';

enum StoreKeys {
  token,
  phone,
  serverUrl,
  User,
  Location,
  Conversation,
  Chat,
}

extension StoreKeysFunctions on StoreKeys {
  String get name => const {
        StoreKeys.token: 'token',
        StoreKeys.phone: 'phone',
        StoreKeys.serverUrl: 'server_url',
        StoreKeys.User: 'user',
        StoreKeys.Location: 'location',
        StoreKeys.Conversation: 'conversation',
        StoreKeys.Chat: 'chat',
      }[this]!;
}

Future<void> initializeHive() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(UserClassAdapter());
  // Hive.registerAdapter(LocationClassAdapter());
  // Hive.registerAdapter(ConversationClassAdapter());
  // Hive.registerAdapter(ChatClassAdapter());

  // await Hive.openBox<User>(StoreKeys.User.name);
  // await Hive.openBox<Location>(StoreKeys.Location.name);
  // await Hive.openBox<Conversation>(StoreKeys.Conversation.name);
  // await Hive.openBox<Chat>(StoreKeys.Chat.name);
  // await Hive.openBox<String>(StoreKeys.token.name);
  // await Hive.openBox<String>(StoreKeys.phone.name);
  // await Hive.openBox<String>(StoreKeys.serverUrl.name);
  await Hive.openBox<String>('storage');
}

abstract class IStorage {
  void saveItem<T>(String cls, T obj);
  void deleteItem<T>(String cls, String key);
  void clearAll<T>(String cls);
  T getItem<T>(String cls, String key);
  List<T> getAll<T>(String cls);
  Future<void> saveOrUpdateOne(String key, String value);
  Future<String> getOne(String key);
  Future<void> deleteOne(String key);
}

class HiveStore implements IStorage {
  final _box = Hive.box<String>('storage');

  @override
  void saveItem<T>(String cls, T obj) {
    Hive.box<T>(cls).add(obj);
  }

  @override
  void deleteItem<T>(String cls, String key) {
    Hive.box<T>(cls).delete(key);
  }

  @override
  void clearAll<T>(String cls) {
    Hive.box<T>(cls).clear();
  }

  @override
  T getItem<T>(String cls, String key) {
    return Hive.box<T>(cls).get(key)!;
  }

  @override
  List<T> getAll<T>(String cls) {
    return Hive.box<T>(cls).values.toList();
  }

  @override
  Future<void> saveOrUpdateOne(String key, String value) async {
    _box.put(key, value);

    // Hive.box<String>(key).add(value);

    // var _box = await Hive.openBox(_store);
    // await _box.put(key, value);
  }

  @override
  Future<String> getOne(String key) async {
    final str = _box.get(key);
    if (str == null) throw 'empty';
    return str;
    // var _box = await Hive.openBox<String>(_store);
    // var result = _box.get(key);
    // try {
    //   final obj = Hive.box<String>(key).getAt(0);
    //   if (obj == null) throw 'empty';
    //   return obj;
    // } catch (e) {
    //   throw 'empty';
    // }
    // if ((key == StoreKeys.token.name || key == StoreKeys.phone.name) &&
    //     (result == null || result == '')) {
    //   throw 'No key';
    // }

    // if (result == null) throw 'no key';

    // return result;
  }

  @override
  Future<void> deleteOne(String key) async {
    _box.delete(key);
    // final b = Hive.box<String>(key);
    // b.deleteAt(0); //.delete(key);
    // var _box = await Hive.openBox(_store);
    // await _box.delete(key);
  }
}

class DummyStore implements IStorage {
  @override
  void clearAll<T>(String cls) {}

  @override
  void deleteItem<T>(String cls, String key) {}

  @override
  Future<void> deleteOne(String key) {
    throw UnimplementedError();
  }

  @override
  List<T> getAll<T>(String cls) {
    throw UnimplementedError();
  }

  @override
  T getItem<T>(String cls, String key) {
    throw UnimplementedError();
  }

  @override
  Future<String> getOne(String key) async {
    return 'abc';
  }

  @override
  void saveItem<T>(String cls, T obj) {}

  @override
  Future<void> saveOrUpdateOne(String key, String value) async {}
}
