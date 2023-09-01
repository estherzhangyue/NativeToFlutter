// Autogenerated from Pigeon (v11.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class RouteEntry;

/// The communication object, this object will be used in dart and in native code
/// encoding and decoding the data will be done automatically
@interface RouteEntry : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithDestination:(NSString *)destination;
@property(nonatomic, copy) NSString * destination;
@end

/// The codec used by FApi.
NSObject<FlutterMessageCodec> *FApiGetCodec(void);

/// This interface will be used to send data from native to dart, in this case
/// the native code will send the current state of the switcher
@interface FApi : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)currentStatePage:(NSString *)page completion:(void (^)(FlutterError *_Nullable))completion;
@end

/// The codec used by HApi.
NSObject<FlutterMessageCodec> *HApiGetCodec(void);

/// This interface will be used to send data from dart to native, in this case
/// the dart code will send a history entry to the native code to be added to
/// the history list
@protocol HApi
- (void)jumpToRouteEntry:(RouteEntry *)entry error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void HApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<HApi> *_Nullable api);

NS_ASSUME_NONNULL_END
