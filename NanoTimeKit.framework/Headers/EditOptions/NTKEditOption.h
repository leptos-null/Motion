//
//  NTKEditOption.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import <Foundation/Foundation.h>
#import "CLKDevice.h"

@interface NTKEditOption : NSObject <NSSecureCoding>

@property (readonly, nonatomic) CLKDevice *device;
@property (readonly, nonatomic) NSString *dailySnapshotKey;
@property (readonly, nonatomic) NSString *localizedName;
@property (readonly, nonatomic) NSString *localizedNameForAction;

- (instancetype)initWithDevice:(CLKDevice *)device;

- (BOOL)isValidOption;

@end
