import 'package:flutter_baidu_yingyan_trace/src/callback/fence_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/interface/fence_interface.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/base_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/add_monitored_person_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/create_fence_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_fence_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_monitored_person_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_fence_list_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_history_alarm_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_list_monitored_person_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_by_location_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/update_fence_option.dart';

class FenceManager extends BaseManager implements FenceInterface {
  static final FenceManager _instance = FenceManager._internal();

  factory FenceManager() => _instance;

  FenceManager._internal();

  @override
  Future<bool> addMonitoredPerson({
    required AddMonitoredPersonOption addMonitoredPersonOption,
    FenceCallback? fenceCallback,
  }) async {
    return await this.baiduYingYanMethodChannel.addMonitoredPerson(
        addMonitoredPersonOption: addMonitoredPersonOption,
        fenceCallback: fenceCallback);
  }

  @override
  Future<bool> createFence({
    required CreateFenceOption createFenceOption,
    FenceCallback? fenceCallback,
  }) async {
    return await this.baiduYingYanMethodChannel.createFence(
        createFenceOption: createFenceOption, fenceCallback: fenceCallback);
  }

  @override
  Future<bool> deleteFence({
    required DeleteFenceOption deleteFenceOption,
    FenceCallback? fenceCallback,
  }) async {
    return await this.baiduYingYanMethodChannel.deleteFence(
        deleteFenceOption: deleteFenceOption, fenceCallback: fenceCallback);
  }

  @override
  Future<bool> deleteMonitoredPerson({
    required DeleteMonitoredPersonOption deleteMonitoredPersonOption,
    FenceCallback? fenceCallback,
  }) async {
    return await this.baiduYingYanMethodChannel.deleteMonitoredPerson(
        deleteMonitoredPersonOption: deleteMonitoredPersonOption,
        fenceCallback: fenceCallback);
  }

  @override
  Future<bool> queryFenceList({
    required QueryFenceListOption queryFenceListOption,
    FenceCallback? fenceCallback,
  }) async {
    return await this.baiduYingYanMethodChannel.queryFenceList(
        queryFenceListOption: queryFenceListOption,
        fenceCallback: fenceCallback);
  }

  @override
  Future<bool> queryHistoryAlarm({
    required QueryHistoryAlarmOption queryHistoryAlarmOption,
    FenceCallback? fenceCallback,
  }) async {
    return await this.baiduYingYanMethodChannel.queryHistoryAlarm(
        queryHistoryAlarmOption: queryHistoryAlarmOption,
        fenceCallback: fenceCallback);
  }

  @override
  Future<bool> queryListMonitoredPerson({
    required QueryListMonitoredPersonOption queryListMonitoredPersonOption,
    FenceCallback? fenceCallback,
  }) async {
    return await this.baiduYingYanMethodChannel.queryListMonitoredPerson(
        queryListMonitoredPersonOption: queryListMonitoredPersonOption,
        fenceCallback: fenceCallback);
  }

  @override
  Future<bool> queryMonitoredStatus({
    required QueryMonitoredStatusOption queryMonitoredStatusOption,
    FenceCallback? fenceCallback,
  }) async {
    return await this.baiduYingYanMethodChannel.queryMonitoredStatus(
        queryMonitoredStatusOption: queryMonitoredStatusOption,
        fenceCallback: fenceCallback);
  }

  @override
  Future<bool> queryMonitoredStatusByLocation({
    required QueryMonitoredStatusByLocationOption
        queryMonitoredStatusByLocationOption,
    FenceCallback? fenceCallback,
  }) async {
    return await this.baiduYingYanMethodChannel.queryMonitoredStatusByLocation(
        queryMonitoredStatusByLocationOption:
            queryMonitoredStatusByLocationOption,
        fenceCallback: fenceCallback);
  }

  @override
  Future<bool> updateFence({
    required UpdateFenceOption updateFenceOption,
    FenceCallback? fenceCallback,
  }) async {
    return await this.baiduYingYanMethodChannel.updateFence(
        updateFenceOption: updateFenceOption, fenceCallback: fenceCallback);
  }
}
