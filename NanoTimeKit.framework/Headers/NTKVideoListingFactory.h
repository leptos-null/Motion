//
//  NTKVideoListingFactory.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import <NanoTimeKit/NTKVideoListing.h>

@interface NTKVideoListingFactory : NSObject

+ (instancetype)sharedInstanceForDevice:(CLKDevice *)device;

- (NTKVideoListing *)defaultListingWithTheme:(NTKVideoTheme)theme;

- (NTKVideoListing *)anyListingWithTheme:(NTKVideoTheme)theme variant:(NSInteger)variant tag:(NSUInteger)tag;
- (NTKVideoListing *)anyListingWithTheme:(NTKVideoTheme)theme variant:(NSInteger)variant tag:(NSUInteger)tag notMatchingClip:(NSInteger)clip;
// there is no 0 variant, and 0 matches all tags, so pass (not: 0, matching: 0) to get a random listing
- (NTKVideoListing *)anyListingWithTheme:(NTKVideoTheme)theme notMatchingVariant:(NSInteger)variant matchingTag:(NSUInteger)tag;

- (UIImage *)posterImageWithTheme:(NTKVideoTheme)theme;
- (NSInteger)behaviorForTheme:(NTKVideoTheme)theme;
- (void)discardAssets;

@end
