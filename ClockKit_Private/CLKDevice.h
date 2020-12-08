//
//  CLKDevice.h
//  ClockKit
//
//  Created by Leptos on 12/7/20.
//

#import <ClockKit/ClockKit.h>
#import <os/lock.h>

@class NRDevice;

@interface CLKDevice : NSObject

@property (class, readonly, nonatomic) CLKDevice *currentDevice;

@property (readonly, nonatomic) int pairedDeviceCapabilitiesChangeNotificationToken; // notify_token
@property (readonly, nonatomic) NSLock *capabilitiesLock;
@property (nonatomic) os_unfair_lock protectedLock;

@property (retain, nonatomic) NRDevice *nrDevice; // NanoRegistry
@property (readonly, nonatomic) NSUUID *nrDeviceUUID;

@property (readonly, nonatomic) BOOL isPaired;

@property (nonatomic) NSUInteger sizeClass;
@property (nonatomic) CGRect screenBounds;
@property (nonatomic) double screenScale;
@property (nonatomic) double screenCornerRadius;

@property (nonatomic) BOOL isLuxo;
@property (readonly, nonatomic) BOOL isZeusBlack;
@property (nonatomic) BOOL isExplorer; // cellular
@property (nonatomic) BOOL isTinker;   // I think this is the family setup thing
@property (nonatomic) BOOL supportsUrsa; // compass
@property (nonatomic) BOOL supportsPolaris; // "always-on" altimeter
@property (readonly, nonatomic) BOOL supportsTritium; // "always-on" display ("AOT")

@end
