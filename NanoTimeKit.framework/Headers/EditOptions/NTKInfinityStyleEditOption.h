//
//  NTKInfinityStyleEditOption.h
//  NanoTimeKit
//
//  Created by Leptos on 12/10/20.
//

#import <NanoTimeKit/EditOptions/NTKEnumeratedEditOption.h>

typedef NS_ENUM(NSUInteger, NTKInfinityStyle) {
    NTKInfinityStyleToyBox, // all
    NTKInfinityStyleBuzz,
    NTKInfinityStyleWoody,
    NTKInfinityStyleJessie,
};

@interface NTKInfinityStyleEditOption : NTKEnumeratedEditOption

@property (readonly, nonatomic) NTKInfinityStyle style;

+ (instancetype)optionWithStyle:(NTKInfinityStyle)style forDevice:(CLKDevice *)device;

@end
