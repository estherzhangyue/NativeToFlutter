// Autogenerated from Pigeon (v11.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "bridge.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}
static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface RouteEntry ()
+ (RouteEntry *)fromList:(NSArray *)list;
+ (nullable RouteEntry *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation RouteEntry
+ (instancetype)makeWithDestination:(NSString *)destination {
  RouteEntry* pigeonResult = [[RouteEntry alloc] init];
  pigeonResult.destination = destination;
  return pigeonResult;
}
+ (RouteEntry *)fromList:(NSArray *)list {
  RouteEntry *pigeonResult = [[RouteEntry alloc] init];
  pigeonResult.destination = GetNullableObjectAtIndex(list, 0);
  NSAssert(pigeonResult.destination != nil, @"");
  return pigeonResult;
}
+ (nullable RouteEntry *)nullableFromList:(NSArray *)list {
  return (list) ? [RouteEntry fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.destination ?: [NSNull null]),
  ];
}
@end

NSObject<FlutterMessageCodec> *FApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  sSharedObject = [FlutterStandardMessageCodec sharedInstance];
  return sSharedObject;
}

@interface FApi ()
@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@end

@implementation FApi

- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  self = [super init];
  if (self) {
    _binaryMessenger = binaryMessenger;
  }
  return self;
}
- (void)currentStatePage:(NSString *)arg_page completion:(void (^)(FlutterError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.switcher.FApi.currentState"
      binaryMessenger:self.binaryMessenger
      codec:FApiGetCodec()];
  [channel sendMessage:@[arg_page ?: [NSNull null]] reply:^(id reply) {
    completion(nil);
  }];
}
@end

@interface HApiCodecReader : FlutterStandardReader
@end
@implementation HApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [RouteEntry fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface HApiCodecWriter : FlutterStandardWriter
@end
@implementation HApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[RouteEntry class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface HApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation HApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[HApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[HApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *HApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    HApiCodecReaderWriter *readerWriter = [[HApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void HApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<HApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.switcher.HApi.jumpToRoute"
        binaryMessenger:binaryMessenger
        codec:HApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(jumpToRouteEntry:error:)], @"HApi api (%@) doesn't respond to @selector(jumpToRouteEntry:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        RouteEntry *arg_entry = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api jumpToRouteEntry:arg_entry error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
