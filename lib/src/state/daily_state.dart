import 'package:tims_logistics/src/model/daily_model.dart';

abstract class DailyState {
  void onSuccess(String success);
  void onError(String error);
  void refreshData(DailyModel dailyModel);
}
