//
//  InterfaceController.m
//  Motion
//
//  Created by Leptos on 12/7/20.
//  Copyright 2020 Leptos. All rights reserved.
//

#import "InterfaceController.h"

#import <NanoTimeKit/NTKTimelapseListingFactory.h>
#import <NanoTimeKit/NTKVideoListingFactory.h>

#import <NanoTimeKit/NTKVideoPlayerListing.h>

#import <NanoTimeKit/EditOptions/NTKTimelapseThemeEditOption.h>
#import <NanoTimeKit/EditOptions/NTKVideoThemeEditOption.h>
#import <NanoTimeKit/EditOptions/NTKFireWaterColorEditOption.h>
#import <NanoTimeKit/EditOptions/NTKMetallicColorEditOption.h>
#import <NanoTimeKit/EditOptions/NTKSmokeColorEditOption.h>

FOUNDATION_EXTERN NSString *UISystemRootDirectory(void);
FOUNDATION_EXTERN UIImage *NTKImageNamedFromAssetsBundleForDevice(NSString *name, CLKDevice *device);

@implementation InterfaceController

- (void)awakeWithContext:(NSNumber *)context {
    self.theme = context.unsignedIntegerValue;
}

- (void)setTheme:(InterfaceTheme)theme {
    _theme = theme;
    
    CLKDevice *device = [CLKDevice currentDevice];
    
    id<NTKAVListing> listing = nil;
    UIImage *posterImage = nil;
    NTKEditOption *editOption = nil;
    switch (theme) {
        case InterfaceThemeVideoButterfly:
        case InterfaceThemeVideoJellyfish:
        case InterfaceThemeVideoFlower: {
            NTKVideoListingFactory *videoFactory = [NTKVideoListingFactory sharedInstanceForDevice:device];
            NTKVideoTheme videoTheme = theme - (InterfaceThemeVideoSTART + 1);
            
            posterImage = [videoFactory posterImageWithTheme:videoTheme];
            listing = [videoFactory defaultListingWithTheme:videoTheme];
            editOption = [NTKVideoThemeEditOption optionWithVideoTheme:videoTheme forDevice:device];
        } break;
        case InterfaceThemeTimelapseMackLake:
        case InterfaceThemeTimelapseNewYork:
        case InterfaceThemeTimelapseHongKong:
        case InterfaceThemeTimelapseLondon:
        case InterfaceThemeTimelapseParis:
        case InterfaceThemeTimelapseShanghai: {
            NTKTimelapseListingFactory *timelapseFactory = [NTKTimelapseListingFactory sharedInstanceForDevice:device];
            NTKTimelapseTheme timelapseTheme = theme - (InterfaceThemeTimelapseSTART + 1);
            
            NSDate *date = [NSDate date];
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(+37.3, -122); // Apple Park
            
            posterImage = [timelapseFactory posterImageWithTheme:timelapseTheme];
            listing = [timelapseFactory listingWithTheme:timelapseTheme date:date location:coord];
            editOption = [NTKTimelapseThemeEditOption optionWithTimelapseTheme:timelapseTheme forDevice:device];
        } break;
            
        case InterfaceThemeFireWaterFire: {
            NTKFireWaterColor firewaterColor = theme - InterfaceThemeFireWaterSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice(@"PosterImage-FireWater-Fullscreen-Fire", device);
            // "Fire_Fullscreen_008", "Fire_Fullscreen_008_Calm"
            listing = [NTKVideoPlayerListing listingForDevice:device withFilename:@"Fire_Fullscreen_008_Calm"];
            editOption = [NTKFireWaterColorEditOption optionWithColor:firewaterColor forDevice:device];
        } break;
        case InterfaceThemeFireWaterWater: {
            NTKFireWaterColor firewaterColor = theme - InterfaceThemeFireWaterSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice(@"PosterImage-FireWater-Fullscreen-Water", device);
            // "Water_Fullscreen_005", "Water_Fullscreen_005_Edge"
            listing = [NTKVideoPlayerListing listingForDevice:device withFilename:@"Water_Fullscreen_005_Edge"];
            editOption = [NTKFireWaterColorEditOption optionWithColor:firewaterColor forDevice:device];
        } break;
            
        case InterfaceThemeMetallicSilver: {
            NTKMetallicColor metallicColor = theme - InterfaceThemeMetallicSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice(@"PosterImage-Metallic-Fullscreen-Silver", device);
            listing = [NTKVideoPlayerListing listingForDevice:device withFilename:@"Metallic_Fullscreen_Silver_003"];
            editOption = [NTKMetallicColorEditOption optionWithColor:metallicColor forDevice:device];
        } break;
        case InterfaceThemeMetallicBlack: {
            NTKMetallicColor metallicColor = theme - InterfaceThemeMetallicSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice(@"PosterImage-Metallic-Fullscreen-Black", device);
            listing = [NTKVideoPlayerListing listingForDevice:device withFilename:@"Metallic_Fullscreen_GunMetal_003"];
            editOption = [NTKMetallicColorEditOption optionWithColor:metallicColor forDevice:device];
        } break;
        case InterfaceThemeMetallicGold: {
            NTKMetallicColor metallicColor = theme - InterfaceThemeMetallicSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice(@"PosterImage-Metallic-Fullscreen-Gold", device);
            listing = [NTKVideoPlayerListing listingForDevice:device withFilename:@"Metallic_Fullscreen_Rose_003"];
            editOption = [NTKMetallicColorEditOption optionWithColor:metallicColor forDevice:device];
        } break;
            
        case InterfaceThemeSmokeBlueGreen: {
            NTKSmokeColor smokeColor = theme - InterfaceThemeSmokeSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice(@"PosterImage-Smoke-Fullscreen-BlueGreen", device);
            listing = [NTKVideoPlayerListing listingForDevice:device withFilename:@"Smoke_Fullscreen_Spearmint_007"];
            editOption = [NTKSmokeColorEditOption optionWithColor:smokeColor forDevice:device];
        } break;
        case InterfaceThemeSmokePinkOrange: {
            NTKSmokeColor smokeColor = theme - InterfaceThemeSmokeSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice(@"PosterImage-Smoke-Fullscreen-PinkOrange", device);
            listing = [NTKVideoPlayerListing listingForDevice:device withFilename:@"Smoke_Fullscreen_Citrus_007"];
            editOption = [NTKSmokeColorEditOption optionWithColor:smokeColor forDevice:device];
        } break;
        case InterfaceThemeSmokeBlackWhite: {
            NTKSmokeColor smokeColor = theme - InterfaceThemeSmokeSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice(@"PosterImage-Smoke-Fullscreen-BlackWhite", device);
            listing = [NTKVideoPlayerListing listingForDevice:device withFilename:@"Smoke_Fullscreen_Neutral_007"];
            editOption = [NTKSmokeColorEditOption optionWithColor:smokeColor forDevice:device];
        } break;
            
        default:
            break;
    }
    
    self.inlineMovie.posterImage = [WKImage imageWithImage:posterImage];
    self.inlineMovie.movieURL = listing.video.url;
    self.title = editOption.localizedName;
}

- (void)didAppear {
    // inspired by github.com/steventroughtonsmith/SpriteKitWatchFace
    id app = [NSClassFromString(@"UIApplication") valueForKey:@"sharedApplication"];
    id statusbarLayer = [app valueForKeyPath:@"statusBar.layer"];
    id navbarLayer = [app valueForKeyPath:@"keyWindow.rootViewController.navigationBar.layer"];
    [statusbarLayer setOpacity:0];
    [navbarLayer setOpacity:0];
    
    [self.inlineMovie playFromBeginning];
}

- (void)willDisappear {
    [self.inlineMovie pause];
}

@end
