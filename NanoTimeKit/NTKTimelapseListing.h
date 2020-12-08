//
//  NTKTimelapseListing.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import "NTKPhotoAnalysis.h"
#import "NTKAVListing.h"

typedef NS_ENUM(NSUInteger, NTKTimelapseTheme) {
    NTKTimelapseThemeMackLake,
    NTKTimelapseThemeNewYork,
    NTKTimelapseThemeHongKong,
    NTKTimelapseThemeLondon,
    NTKTimelapseThemeParis,
    NTKTimelapseThemeShanghai,
};

@interface NTKTimelapseListing : NSObject <NSCopying, NTKAVListing>

@property (readonly, nonatomic) NTKTimelapseTheme theme;
@property (readonly, nonatomic) NSInteger videoIndex;
@property (readonly, nonatomic) NTKPhotoAnalysis *photoAnalysis;

- (BOOL)isSimilarTo:(NTKTimelapseListing *)other;

@end
