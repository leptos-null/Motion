//
//  CLKDevice.h
//  ClockKit
//
//  Created by Leptos on 12/7/20.
//

#import <ClockKit/ClockKit.h>

@interface CLKDevice : NSObject

@property (class, readonly, nonatomic) CLKDevice *currentDevice;

@property (readonly, nonatomic) BOOL isPaired;

@property (nonatomic) NSUInteger sizeClass;
@property (nonatomic) CGRect screenBounds;
@property (nonatomic) double screenScale;
@property (nonatomic) double screenCornerRadius;

// Collections:
//   Zeus - Hermes
//   Victory - Nike
//   IceMan - Edition
@property (readonly, nonatomic) BOOL isZeusBlack;
@property (nonatomic) BOOL isLuxo; // Series 4 form factor
@property (nonatomic) BOOL isExplorer; // cellular
@property (nonatomic) BOOL isTinker; // I think this is Family Setup; the state of this can change
@property (nonatomic) BOOL supportsUrsa; // compass
@property (nonatomic) BOOL supportsPolaris; // "always-on" altimeter
@property (readonly, nonatomic) BOOL supportsTritium; // "always-on" display ("AOT")

@end
