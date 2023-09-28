import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress_project/src/presentation/ui/navigation/cubit/navigation_cubit.dart';
import 'package:waitress_project/src/presentation/ui/table/cubit/person_state.dart';

import '../../../../core/keys.dart';
import '../../../../domain/repositories/repository_main.dart';
import '../../add_order/add_order_page.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(const PersonState());
  final repo = RepositoryMain();
  Future<void> changeNumbers(numberOfPersons) async {
    emit(state.copyWith(numberOfPersons: numberOfPersons));
  }

  Future<void> createOrderHeader(context, NavigationCubit navigationCubit) async {
    emit(state.copyWith(stage: PersonStage.LOADING));
    var idOfOrder = await repo.orderCreate(Keys.tableId, state.numberOfPersons);
    if (idOfOrder != null) {
      Keys.orderId=idOfOrder['orderId'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: navigationCubit,
              child: const AddOrderPage(),
            );
          },
        ),
      );
    }
    emit(state.copyWith(stage: PersonStage.LOADED));
  }
}
