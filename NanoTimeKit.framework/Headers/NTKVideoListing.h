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
@property (readonly, nonatomic) NSInteger variant;
@property (readonly, nonatomic) NSInteger clip;

@property (readonly, nonatomic) UIColor *overlayColor;

- (BOOL)hasTag:(NSUInteger)tag;

@end
