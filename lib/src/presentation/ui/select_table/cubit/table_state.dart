import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/hall_response_model.dart';


part 'table_state.freezed.dart';

@freezed
class TableState with _$TableState{
  const factory TableState({
    List<HallResponseModel>? halls,
}) = _TableState;
}

enum TableStage {
  LOADING,
  LOADED,
}
