//
//  BTFYingYanManager.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFYingYanManager.h"
#import "BTFYingYanMethodConst.h"
#import "BTFYingYanHandler.h"
#import "BTFAnalysisHandlers.h"
#import "BTFEntityHandlers.h"
#import "BTFFenceHandlers.h"
#import "BTFGatherHandlers.h"
#import "BTFTrackHandlers.h"
#import "BTFYingYanLocalHandlers.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

// 如果release状态就不执行NSLog函数
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
# define NSLog(...) {}
#endif

static NSString *kSDKSetAgreePrivacyApiMethod = @"flutter_baidu_yingyan_trace/sdk/setAgreePrivacy";

@interface BTFYingYanManager ()
/// channel
@property (nonatomic, strong) FlutterMethodChannel *channel;
@end

@implementation BTFYingYanManager

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutter_baidu_yingyan_trace"
                                     binaryMessenger:[registrar messenger]];
    BTFYingYanManager *instance = [[BTFYingYanManager alloc] init];
    instance.channel = channel;
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSObject<BTFYingYanHandler> *defaultCenter = nil;
    if ([call.method hasPrefix:kAnalysisMethods]) {
        defaultCenter = [BTFAnalysisHandlers defalutCenter];
    } else if ([call.method hasPrefix:kEntityMethods]) {
        defaultCenter = [BTFEntityHandlers defalutCenter];
    } else if ([call.method hasPrefix:kFenceyMethods]) {
        defaultCenter = [BTFFenceHandlers defalutCenter];
    } else if ([call.method hasPrefix:kGatherMethods]) {
       defaultCenter = [BTFGatherHandlers defalutCenter];
    } else if ([call.method hasPrefix:kTrackMethods]) {
        defaultCenter = [BTFTrackHandlers defalutCenter];
    } else if ([call.method hasPrefix:kLocalPermissionMethods]){
        defaultCenter = [BTFYingYanLocalHandlers defalutCenter];
    } else if ([kSDKSetAgreePrivacyApiMethod isEqualToString:call.method]) {
        NSDictionary *dic = (NSDictionary *)call.arguments;
        BOOL isAgree = [dic[@"isAgree"] boolValue];
        [BTKPrivacyAuthorization setAgreePrivacy:isAgree];
        NSLog(@"ios-设置用户是否同意SDK隐私协议：%d", isAgree);
    }
    
    if (defaultCenter) {
        [defaultCenter configChannel:_channel];
        [defaultCenter handleMethodCall:call result:result];
    } else {
         result(FlutterMethodNotImplemented);
    }
}
@end
