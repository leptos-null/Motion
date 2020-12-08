//
//  InterfaceController.h
//  Motion
//
//  Created by Leptos on 12/7/20.
//  Copyright 2020 Leptos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
#import <dlfcn.h>

typedef NS_ENUM(NSUInteger, InterfaceTheme) {
    InterfaceThemeVideoSTART, // add 1
    InterfaceThemeVideoButterfly,
    InterfaceThemeVideoJellyfish,
    InterfaceThemeVideoFlower,
    
    InterfaceThemeTimelapseSTART, // add 1
    InterfaceThemeTimelapseMackLake,
    InterfaceThemeTimelapseNewYork,
    InterfaceThemeTimelapseHongKong,
    InterfaceThemeTimelapseLondon,
    InterfaceThemeTimelapseParis,
    InterfaceThemeTimelapseShanghai,
    
    InterfaceThemeFireWaterSTART, // don't add 1
    InterfaceThemeFireWaterFireAll = InterfaceThemeFireWaterSTART,
    InterfaceThemeFireWaterFire,
    InterfaceThemeFireWaterWater,
    
    InterfaceThemeMetallicSTART, // don't add 1
    InterfaceThemeMetallicAll = InterfaceThemeMetallicSTART,
    InterfaceThemeMetallicSilver,
    InterfaceThemeMetallicBlack,
    InterfaceThemeMetallicGold,
    
    InterfaceThemeSmokeSTART, // don't add 1
    InterfaceThemeSmokeAll = InterfaceThemeSmokeSTART,
    InterfaceThemeSmokeBlueGreen,
    InterfaceThemeSmokePinkOrange,
    InterfaceThemeSmokeBlackWhite
};

@interface InterfaceController : WKInterfaceController

@property (nonatomic) InterfaceTheme theme;
@property (strong, nonatomic) IBOutlet WKInterfaceInlineMovie *inlineMovie;

@end
