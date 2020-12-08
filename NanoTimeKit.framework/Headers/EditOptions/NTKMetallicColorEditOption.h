//
//  NTKMetallicColorEditOption.h
//  NanoTimeKit
//
//  Created by Leptos on 12/8/20.
//

#import <NanoTimeKit/EditOptions/NTKEnumeratedEditOption.h>

typedef NS_ENUM(NSUInteger, NTKMetallicColor) {
    NTKMetallicColorAll,
    NTKMetallicColorSilver,
    NTKMetallicColorBlack,
    NTKMetallicColorGold,
};

@interface NTKMetallicColorEditOption : NTKEnumeratedEditOption

@property (readonly, nonatomic) NTKMetallicColor color;

+ (instancetype)optionWithColor:(NTKMetallicColor)color forDevice:(CLKDevice *)device;

@end
