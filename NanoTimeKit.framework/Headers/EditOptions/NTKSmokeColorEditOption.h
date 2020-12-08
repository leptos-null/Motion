//
//  NTKSmokeColorEditOption.h
//  NanoTimeKit
//
//  Created by Leptos on 12/8/20.
//

#import <NanoTimeKit/EditOptions/NTKEnumeratedEditOption.h>

typedef NS_ENUM(NSUInteger, NTKSmokeColor) {
    NTKSmokeColorAll,
    NTKSmokeColorBlueGreen,
    NTKSmokeColorPinkOrange,
    NTKSmokeColorBlackWhite,
};

@interface NTKSmokeColorEditOption : NTKEnumeratedEditOption

@property (readonly, nonatomic) NTKSmokeColor color;

+ (instancetype)optionWithColor:(NTKSmokeColor)color forDevice:(CLKDevice *)device;

@end
