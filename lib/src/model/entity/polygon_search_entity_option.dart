import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';

/// 多边形搜索：根据设定的多边形进行搜索
class PolygonSearchEntityOption extends CommonSearchOption {
  /// 多边形边界点
  late List<LatLng> vertexes;

  /// 多边形边界点的坐标类型，默认为百度经纬度
  CoordType? coordTypeInput;

  PolygonSearchEntityOption({
    required int tag,
    required int serviceId,
    required this.vertexes,
    this.coordTypeInput: CoordType.BD09LL,
    SearchFilterCondition? searchFilterCondition,
    SortBy? sortBy,
    CoordType coordType: CoordType.BD09LL,
    int pageIndex: 1,
    int pageSize: 100,
  })  : assert(vertexes != null), // ignore: unnecessary_null_comparison
        super(
            tag: tag,
            serviceId: serviceId,
            searchFilterCondition: searchFilterCondition,
            sortBy: sortBy,
            coordType: coordType,
            pageIndex: pageIndex,
            pageSize: pageSize);

  PolygonSearchEntityOption.fromMap(Map map)
      : assert(map != null), // ignore: unnecessary_null_comparison
        super.fromMap(map) {
    if (map['vertexes'] != null) {
      vertexes = [];
      map['vertexes'].forEach((e) {
        vertexes.add(LatLng.fromMap(e as Map));
      });
    }
    if (map['coordTypeInput'] != null) {
      int value = map['coordTypeInput'] as int;
      if (value >= 0 && value <= 2) {
        coordTypeInput = CoordType.values[value];
      }
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['coordTypeInput'] = this.coordTypeInput?.index;
    map['vertexes'] = this.vertexes.map((e) => e.toMap()).toList();
    return map;
  }
}
