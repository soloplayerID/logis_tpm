class TotalDailyResponse {
  bool? status;
  Data? data;

  TotalDailyResponse({this.status, this.data});

  TotalDailyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
      {this.totalInbound,
      this.totalInboundMaterial,
      this.totalOutbound,
      this.totalOutboundMaterial,
      this.totalTransit,
      this.totalTransitMaterial,
      this.transactionStartDate,
      this.transactionEndDate,
      this.condition,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    totalInbound = json['total_inbound'];
    totalInboundMaterial = json['total_inbound_material'];
    totalOutbound = json['total_outbound'];
    totalOutboundMaterial = json['total_outbound_material'];
    totalTransit = json['total_transit'];
    totalTransitMaterial = json['total_transit_material'];
    transactionStartDate = json['transaction_start_date'];
    transactionEndDate = json['transaction_end_date'];
    condition = json['condition'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_inbound'] = totalInbound;
    data['total_inbound_material'] = totalInboundMaterial;
    data['total_outbound'] = totalOutbound;
    data['total_outbound_material'] = totalOutboundMaterial;
    data['total_transit'] = totalTransit;
    data['total_transit_material'] = totalTransitMaterial;
    data['transaction_start_date'] = transactionStartDate;
    data['transaction_end_date'] = transactionEndDate;
    data['condition'] = condition;
    data['status'] = status;
    return data;
  }
}
