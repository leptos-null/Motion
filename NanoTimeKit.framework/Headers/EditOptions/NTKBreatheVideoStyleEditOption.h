//
//  NTKBreatheVideoStyleEditOption.h
//  NanoTimeKit
//
//  Created by Leptos on 12/11/20.
//

#import <NanoTimeKit/EditOptions/NTKEnumeratedEditOption.h>

typedef NS_ENUM(NSUInteger, NTKBreatheVideoStyle) {
    NTKBreatheVideoStyleClassic,
    NTKBreatheVideoStyleCalm,
    NTKBreatheVideoStyleFocus,
};

@interface NTKBreatheVideoStyleEditOption : NTKEnumeratedEditOption

@property (readonly, nonatomic) NTKBreatheVideoStyle style;

+ (instancetype)optionWithStyle:(NTKBreatheVideoStyle)style forDevice:(CLKDevice *)device;

@end
