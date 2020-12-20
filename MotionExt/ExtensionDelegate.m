//
//  ExtensionDelegate.m
//  Motion
//
//  Created by Leptos on 12/7/20.
//  Copyright 2020 Leptos. All rights reserved.
//

#import "ExtensionDelegate.h"
#import "InterfaceController.h"

@implementation ExtensionDelegate

- (void)applicationDidFinishLaunching {
    NSArray<NSNumber *> *contexts = @[
        @(InterfaceThemeVideoButterfly),
        @(InterfaceThemeVideoJellyfish),
        @(InterfaceThemeVideoFlower),
        
        @(InterfaceThemeTimelapseMackLake),
        @(InterfaceThemeTimelapseNewYork),
        @(InterfaceThemeTimelapseHongKong),
        @(InterfaceThemeTimelapseLondon),
        @(InterfaceThemeTimelapseParis),
        @(InterfaceThemeTimelapseShanghai),
        
        @(InterfaceThemeFireWaterFire),
        @(InterfaceThemeFireWaterWater),
        
        @(InterfaceThemeMetallicSilver),
        @(InterfaceThemeMetallicBlack),
        @(InterfaceThemeMetallicGold),
        
        @(InterfaceThemeSmokeBlueGreen),
        @(InterfaceThemeSmokePinkOrange),
        @(InterfaceThemeSmokeBlackWhite),
        
        @(InterfaceThemeBreatheClassic),
        @(InterfaceThemeBreatheCalm),
        @(InterfaceThemeBreatheFocus),
        
        @(InterfaceThemeInfinityBuzz),
        @(InterfaceThemeInfinityWoody),
        @(InterfaceThemeInfinityJessie),
        @(InterfaceThemeInfinitySupporting),
    ];
    
    NSUInteger contextCount = contexts.count;
    NSMutableArray *controllerNames = [NSMutableArray arrayWithCapacity:contextCount];
    for (NSUInteger idx = 0; idx < contextCount; idx++) {
        controllerNames[idx] = @"main";
    }
    [WKInterfaceController reloadRootPageControllersWithNames:controllerNames contexts:contexts orientation:WKPageOrientationVertical pageIndex:0];
}

- (void)handleBackgroundTasks:(NSSet<WKRefreshBackgroundTask *> *)backgroundTasks {
    // Sent when the system needs to launch the application in the background to process tasks.
    for (WKRefreshBackgroundTask *task in backgroundTasks) {
        [task setTaskCompletedWithSnapshot:NO];
    }
}

@end
