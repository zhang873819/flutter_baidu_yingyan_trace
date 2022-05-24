//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_baidu_yingyan_trace/FlutterBaiduYingyanTracePlugin.h>)
#import <flutter_baidu_yingyan_trace/FlutterBaiduYingyanTracePlugin.h>
#else
@import flutter_baidu_yingyan_trace;
#endif

#if __has_include(<permission_handler/PermissionHandlerPlugin.h>)
#import <permission_handler/PermissionHandlerPlugin.h>
#else
@import permission_handler;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterBaiduYingyanTracePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBaiduYingyanTracePlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
}

@end
