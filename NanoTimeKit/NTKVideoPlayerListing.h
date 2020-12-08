//
//  NTKVideoPlayerListing.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import "NTKAVListing.h"

@interface NTKVideoPlayerListing : NSObject <NSCopying, NTKAVListing>

@property (retain, nonatomic) NSArray *attributes;
@property (retain, nonatomic) UIColor *color;
@property (nonatomic) NSUInteger endBehavior;

+ (instancetype)listingForDevice:(CLKDevice *)device withFilename:(NSString *)filename;
+ (instancetype)listingForDevice:(CLKDevice *)device withFilename:(NSString *)filename andColor:(UIColor *)color;

- (instancetype)initForDevice:(CLKDevice *)device withFilename:(NSString *)filename;

@end
