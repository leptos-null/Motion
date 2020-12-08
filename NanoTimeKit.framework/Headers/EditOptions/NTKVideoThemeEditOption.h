//
//  NTKVideoThemeEditOption.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import <NanoTimeKit/EditOptions/NTKEnumeratedEditOption.h>
#import <NanoTimeKit/NTKVideoListing.h>

@interface NTKVideoThemeEditOption : NTKEnumeratedEditOption

@property (readonly, nonatomic) NTKVideoTheme videoTheme;

+ (instancetype)optionWithVideoTheme:(NTKVideoTheme)videoTheme forDevice:(CLKDevice *)device;

@end
