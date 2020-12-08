//
//  NTKTimelapseListingFactory.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import <CoreLocation/CoreLocation.h>
#import "CLKDevice.h"

#import <NanoTimeKit/NTKTimelapseListing.h>

@interface NTKTimelapseListingFactory : NSObject

+ (instancetype)sharedInstanceForDevice:(CLKDevice *)device;

- (UIImage *)posterImageWithTheme:(NTKTimelapseTheme)theme;
- (UIImage *)heroImageWithTheme:(NTKTimelapseTheme)theme date:(NSDate *)date location:(CLLocationCoordinate2D)location;
- (NTKTimelapseListing *)listingWithTheme:(NTKTimelapseTheme)theme date:(NSDate *)date location:(CLLocationCoordinate2D)location;

- (void)discardAssets;

@end
