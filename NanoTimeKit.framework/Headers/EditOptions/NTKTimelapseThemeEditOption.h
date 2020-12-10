//
//  NTKTimelapseThemeEditOption.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import <NanoTimeKit/EditOptions/NTKEnumeratedEditOption.h>
#import <NanoTimeKit/NTKTimelapseListing.h>

@interface NTKTimelapseThemeEditOption : NTKEnumeratedEditOption

@property (readonly, nonatomic) NTKTimelapseTheme timelapseTheme;
@property (readonly, nonatomic) NSString *resourceBaseName;
@property (readonly, nonatomic) NSString *resourceName;

+ (instancetype)optionWithTimelapseTheme:(NTKTimelapseTheme)timelapseTheme forDevice:(CLKDevice *)device;
- (NSString *)resourceNameWithVideoIndex:(NSInteger)videoIndex;

@end
