
/// 开启鹰眼服务请求类
class Trace {
  /// 轨迹服务ID（android必传，iOS可不传，在configServerInfo中传入即可）
  int? serviceId;

  /// 用户自定义的entity标识，同一serviceId下该字段不允许重复，是entity的唯一标识 （必传）
  String? entityName;

  bool? startNotification;

  /// 该dbEntityName只用于数据库升级(Android 独有)
  String? dbEntityName = "";

  Trace(
      {required this.serviceId, required this.entityName, this.startNotification = false, this.dbEntityName});

  Trace.fromMap(Map map) : assert(map != null) { // ignore: unnecessary_null_comparison
    serviceId = map['serviceId'];
    entityName = map['entityName'];
    startNotification = map['startNotification'];
    dbEntityName = map['dbEntityName'];
  }

  Map toMap() {
    return {
      "serviceId": this.serviceId,
      "entityName": this.entityName,
      "startNotification": this.startNotification,
      "dbEntityName": this.dbEntityName,
    };
  }
}
