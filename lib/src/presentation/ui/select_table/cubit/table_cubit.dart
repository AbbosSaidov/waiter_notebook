import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress_project/src/presentation/ui/select_table/cubit/table_state.dart';

import '../../../../data/models/hall_response_model.dart';
import '../../../../data/models/table_response_model.dart';
import '../../../../domain/repositories/repository_main.dart';

class TableCubit extends Cubit<TableState> {
  TableCubit() : super(const TableState());

  final repo = RepositoryMain();
  late final StreamSubscription _subscription;

  // Initialize the subscription
  void init(List<HallResponseModel> halls) {
    fetch(halls);
    _subscription = Stream.periodic(const Duration(seconds: 5)).listen((_) async {
      await fetch(halls);
    });
  }

  // Dispose to clean resources
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  // Fetches tables
  Future<void> fetch(List<HallResponseModel> halls) async {
    var tables = (await repo.getTable()) ?? [];

    _resetHalls(halls);

    _associateTablesToHalls(tables, halls);

    emit(state.copyWith(halls: halls));
  }

  void _resetHalls(List<HallResponseModel> halls) {
    for (int i = 0; i < halls.length; i++) {
      halls[i].tables = [];
    }
  }

  void _associateTablesToHalls(List<TableResponseModel> tables, List<HallResponseModel> halls) {
    for (var table in tables) {
      for (var hall in halls) {
        if (table.hall.toString() == hall.ident.toString()) {
          hall.tables?.add(table);
          break;
        }
      }
    }
  }
}
