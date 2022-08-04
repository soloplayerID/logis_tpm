import 'package:tims_logistics/src/response/total_daily_response.dart';

class Daily {
  int? totalInbound;
  int? totalInboundMaterial;
  int? totalOutbound;
  int? totalOutboundMaterial;
  int? totalTransit;
  int? totalTransitMaterial;
  String? transactionStartDate;
  String? transactionEndDate;
  String? condition;
  String? status;
  Daily({
    required this.totalInbound,
    required this.totalInboundMaterial,
    required this.totalOutbound,
    required this.totalOutboundMaterial,
    required this.totalTransit,
    required this.totalTransitMaterial,
    required this.transactionStartDate,
    required this.transactionEndDate,
    required this.condition,
    required this.status,
  });
}

class DailyModel {
  bool isloading = false;
  bool isSuccess = false;
  List<Daily> daily = <Daily>[];
  TotalDailyResponse dailyResponse = TotalDailyResponse();
}
