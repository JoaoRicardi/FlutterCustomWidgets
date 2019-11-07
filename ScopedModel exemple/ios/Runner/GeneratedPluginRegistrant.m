//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <device_id/DeviceIdPlugin.h>
#import <device_info/DeviceInfoPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [DeviceIdPlugin registerWithRegistrar:[registry registrarForPlugin:@"DeviceIdPlugin"]];
  [FLTDeviceInfoPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTDeviceInfoPlugin"]];
}

@end
