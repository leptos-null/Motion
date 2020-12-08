//
//  CLKVideo.h
//  ClockKit
//
//  Created by Leptos on 12/7/20.
//

#import "CLKDevice.h"

@interface CLKVideo : NSObject <NSCopying>

@property (readonly, nonatomic) NSURL *url;
@property (readonly, nonatomic) NSString *name;

+ (instancetype)videoNamed:(NSString *)name forDevice:(CLKDevice *)device; /* main bundle */
+ (instancetype)videoNamed:(NSString *)name forDevice:(CLKDevice *)device inBundle:(NSBundle *)bundle;

+ (instancetype)videoWithName:(NSString *)name forDevice:(CLKDevice *)device url:(NSURL *)url;
- (instancetype)initWithName:(NSString *)name forDevice:(CLKDevice *)a1 url:(NSURL *)url;

@end
