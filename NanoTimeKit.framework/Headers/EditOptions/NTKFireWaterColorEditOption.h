//
//  NTKFireWaterColorEditOption.h
//  NanoTimeKit
//
//  Created by Leptos on 12/8/20.
//

#import <NanoTimeKit/EditOptions/NTKEnumeratedEditOption.h>

typedef NS_ENUM(NSUInteger, NTKFireWaterColor) {
    NTKFireWaterColorAll,
    NTKFireWaterColorFire,
    NTKFireWaterColorWater,
};

@interface NTKFireWaterColorEditOption : NTKEnumeratedEditOption

@property (readonly, nonatomic) NTKFireWaterColor color;

+ (instancetype)optionWithColor:(NTKFireWaterColor)color forDevice:(CLKDevice *)device;

@end
