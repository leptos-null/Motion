//
//  NTKVideoPlayerListing.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import <NanoTimeKit/NTKAVListing.h>

// based on NTKVideoPlayerView.videoPlayerViewDidPauseAfterPlayingVideoToEnd behavior
typedef NS_ENUM(NSUInteger, NTKVideoEndBehavior) {
    NTKVideoEndBehaviorNext, // play next
    NTKVideoEndBehaviorFade, // fade out
    NTKVideoEndBehaviorLoop, // play again
};

@interface NTKVideoPlayerListing : NSObject <NSCopying, NTKAVListing>

@property (retain, nonatomic) NSArray *attributes;
@property (retain, nonatomic) UIColor *color;
@property (nonatomic) NTKVideoEndBehavior endBehavior;

+ (instancetype)listingForDevice:(CLKDevice *)device withFilename:(NSString *)filename;
+ (instancetype)listingForDevice:(CLKDevice *)device withFilename:(NSString *)filename andColor:(UIColor *)color;

- (instancetype)initForDevice:(CLKDevice *)device withFilename:(NSString *)filename;

@end
