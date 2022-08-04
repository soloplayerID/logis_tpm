import 'package:tims_logistics/src/model/daily_model.dart';
import 'package:tims_logistics/src/state/daily_state.dart';

abstract class DailyPresenterAbstrack {
  set view(DailyState view) {}
  void getData() {}
}

class DailyPresenter implements DailyPresenterAbstrack {
  final DailyModel _dailyModel = DailyModel();
  late DailyState _dailyState;
  @override
  void getData() {}

  @override
  set view(DailyState view) {
    _dailyState = view;
    _dailyState.refreshData(_dailyModel);
  }
}
