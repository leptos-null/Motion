//
//  NTKVideoListing.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import <NanoTimeKit/NTKAVListing.h>

typedef NS_ENUM(NSUInteger, NTKVideoTheme) {
    NTKVideoThemeButterfly,
    NTKVideoThemeJellyfish,
    NTKVideoThemeFlower,
};

@interface NTKVideoListing : NSObject <NSCopying, NTKAVListing>

@property (readonly, nonatomic) NTKVideoTheme theme;
// Butterfly: {1..25}
// Jellyfish: {26..44}
// Flower:    {45..52}
@property (readonly, nonatomic) NSInteger variant;
// Butterfly: {1..4}
// Jellyfish: {1}
// Flower:    {1}
@property (readonly, nonatomic) NSInteger clip;

@property (readonly, nonatomic) UIColor *overlayColor;

- (instancetype)initForDevice:(CLKDevice *)device withName:(NSString *)name videoName:(NSString *)videoName transitionImageName:(NSString *)transitionImageName overlayColor:(UIColor *)overlayColor theme:(NTKVideoTheme)theme variant:(NSInteger)variant clip:(NSInteger)clip tags:(NSUInteger)tags;

// return (tags & tag) == tag
// known tags:
//   100
//   011
//   010
- (BOOL)hasTag:(NSUInteger)tag;

@end
