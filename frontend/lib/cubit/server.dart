import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fleet/pkg/clipboard.dart';
import 'package:fleet/pkg/storage.dart';

part 'server.freezed.dart';

@freezed
class ServerState with _$ServerState {
  const factory ServerState({
    @Default('') String url,
  }) = _ServerState;
}

class ServerCubit extends Cubit<ServerState> {
  ServerCubit(
    this._storage,
    this._clipBoard,
  ) : super(const ServerState(url: 'http://34.93.199.198')) {
    // if (Platform.isAndroid)
    //   emit(
    //     const ServerState(url: 'http://10.0.2.2:8000'),
    //   );

    // if (Platform.isIOS)
    //   emit(
    //     const ServerState(url: 'http://localhost:8000'),
    //   );

    // init();
  }

  final IStorage _storage;
  final IClipBoard _clipBoard;

  void init() async {
    try {
      final url = await _storage.getOne(StoreKeys.serverUrl.name);
      emit(ServerState(url: url));
    } catch (e) {
      // print(e.toString() + '\n' + s.toString());
    }
  }

  void urlChanged(String url) {
    emit(ServerState(url: url));
  }

  void updateUrl() async {
    await _storage.saveOrUpdateOne(
      StoreKeys.serverUrl.name,
      state.url,
    );
    emit(ServerState(url: state.url));
  }

  void pasteUrl() async {
    final url = await _clipBoard.pasteFromClipBoard();
    emit(ServerState(url: url));
  }
}
