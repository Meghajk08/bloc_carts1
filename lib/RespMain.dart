import 'Carts.dart';
import 'dart:convert';

RespMain respMainFromJson(String str) => RespMain.fromJson(json.decode(str));
String respMainToJson(RespMain data) => json.encode(data.toJson());
class RespMain {
  RespMain({
      this.carts, 
      this.total, 
      this.skip, 
      this.limit,});

  RespMain.fromJson(dynamic json) {
    if (json['carts'] != null) {
      carts = [];
      json['carts'].forEach((v) {
        carts?.add(Carts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<Carts>? carts;
  num? total;
  num? skip;
  num? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (carts != null) {
      map['carts'] = carts?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}