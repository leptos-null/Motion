//
//  NTKVideoListingFactory.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import "NTKVideoListing.h"

@interface NTKVideoListingFactory : NSObject

+ (instancetype)sharedInstanceForDevice:(CLKDevice *)device;

- (NTKVideoListing *)defaultListingWithTheme:(NTKVideoTheme)theme;

- (NTKVideoListing *)anyListingWithTheme:(NTKVideoTheme)theme variant:(NSInteger)variant tag:(NSUInteger)tag;
- (NTKVideoListing *)anyListingWithTheme:(NTKVideoTheme)theme variant:(NSInteger)variant tag:(NSUInteger)tag notMatchingClip:(NSInteger)clip;
- (NTKVideoListing *)anyListingWithTheme:(NTKVideoTheme)theme notMatchingVariant:(NSInteger)variant matchingTag:(NSUInteger)tag;

- (UIImage *)posterImageWithTheme:(NTKVideoTheme)theme;
- (NSInteger)behaviorForTheme:(NTKVideoTheme)theme;
- (void)discardAssets;

@end
