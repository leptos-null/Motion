//
//  InterfaceController.m
//  Motion
//
//  Created by Leptos on 12/7/20.
//  Copyright 2020 Leptos. All rights reserved.
//

#import "InterfaceController.h"

#import "../NanoTimeKit/NTKTimelapseListingFactory.h"
#import "../NanoTimeKit/NTKVideoListingFactory.h"

#import "../NanoTimeKit/NTKVideoPlayerListing.h"

#import "../NanoTimeKit/EditOptions/NTKTimelapseThemeEditOption.h"
#import "../NanoTimeKit/EditOptions/NTKVideoThemeEditOption.h"
#import "../NanoTimeKit/EditOptions/NTKFireWaterColorEditOption.h"
#import "../NanoTimeKit/EditOptions/NTKMetallicColorEditOption.h"
#import "../NanoTimeKit/EditOptions/NTKSmokeColorEditOption.h"

FOUNDATION_EXPORT NSString *UISystemRootDirectory(void);

/* these don't seem to work */
static UIColor *(*blackAndSilverListingColor_func)(void);
static UIColor *(*citrusListingColor_func)(void);
static UIColor *(*fireListingColor_func)(void);
static UIColor *(*goldListingColor_func)(void);
static UIColor *(*neutralListingColor_func)(void);
static UIColor *(*spearmintListingColor_func)(void);
static UIColor *(*waterListingColor_func)(void);
/* this does work */
static UIImage *(*NTKImageNamedFromAssetsBundleForDevice_func)(NSString *name, CLKDevice *device);

static Class CLKDevice_cls;
static Class NTKVideoPlayerListing_cls;

static Class NTKVideoListingFactory_cls;
static Class NTKTimelapseListingFactory_cls;

static Class NTKVideoThemeEditOption_cls;
static Class NTKTimelapseThemeEditOption_cls;
static Class NTKFireWaterColorEditOption_cls;
static Class NTKMetallicColorEditOption_cls;
static Class NTKSmokeColorEditOption_cls;

@implementation InterfaceController

+ (void)initialize {
    NSString *sysroot = UISystemRootDirectory();
    NSString *bundlePath = [sysroot stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/NanoTimeKit.framework/NanoTimeKit"];
    
    void *handle = dlopen(bundlePath.fileSystemRepresentation, RTLD_LAZY);
    
    blackAndSilverListingColor_func = dlsym(handle, "_blackAndSilverListingColor");
    citrusListingColor_func = dlsym(handle, "_citrusListingColor");
    fireListingColor_func = dlsym(handle, "_fireListingColor");
    goldListingColor_func = dlsym(handle, "_goldListingColor");
    neutralListingColor_func = dlsym(handle, "_neutralListingColor");
    spearmintListingColor_func = dlsym(handle, "_spearmintListingColor");
    waterListingColor_func = dlsym(handle, "_waterListingColor");
    waterListingColor_func = dlsym(handle, "_waterListingColor");

    NTKImageNamedFromAssetsBundleForDevice_func = dlsym(handle, "NTKImageNamedFromAssetsBundleForDevice");
    dlclose(handle);
    
    CLKDevice_cls = NSClassFromString(@"CLKDevice");
    NTKVideoPlayerListing_cls = NSClassFromString(@"NTKVideoPlayerListing");
    
    NTKVideoListingFactory_cls = NSClassFromString(@"NTKVideoListingFactory");
    NTKTimelapseListingFactory_cls = NSClassFromString(@"NTKTimelapseListingFactory");
    
    NTKVideoThemeEditOption_cls = NSClassFromString(@"NTKVideoThemeEditOption");
    NTKTimelapseThemeEditOption_cls = NSClassFromString(@"NTKTimelapseThemeEditOption");
    NTKFireWaterColorEditOption_cls = NSClassFromString(@"NTKFireWaterColorEditOption");
    NTKMetallicColorEditOption_cls = NSClassFromString(@"NTKMetallicColorEditOption");
    NTKSmokeColorEditOption_cls = NSClassFromString(@"NTKSmokeColorEditOption");
}

- (void)awakeWithContext:(NSNumber *)context {
    self.theme = context.unsignedIntegerValue;
}

- (void)setTheme:(InterfaceTheme)theme {
    _theme = theme;
    
    CLKDevice *device = (CLKDevice *)[CLKDevice_cls currentDevice];
    
    id<NTKAVListing> listing = nil;
    UIImage *posterImage = nil;
    NTKEditOption *editOption = nil;
    switch (theme) {
        case InterfaceThemeVideoButterfly:
        case InterfaceThemeVideoJellyfish:
        case InterfaceThemeVideoFlower: {
            NTKVideoListingFactory *videoFactory = [NTKVideoListingFactory_cls sharedInstanceForDevice:device];
            NTKVideoTheme videoTheme = theme - (InterfaceThemeVideoSTART + 1);
            
            posterImage = [videoFactory posterImageWithTheme:videoTheme];
            listing = [videoFactory defaultListingWithTheme:videoTheme];
            editOption = [NTKVideoThemeEditOption_cls optionWithVideoTheme:videoTheme forDevice:device];
        } break;
        case InterfaceThemeTimelapseMackLake:
        case InterfaceThemeTimelapseNewYork:
        case InterfaceThemeTimelapseHongKong:
        case InterfaceThemeTimelapseLondon:
        case InterfaceThemeTimelapseParis:
        case InterfaceThemeTimelapseShanghai: {
            NTKTimelapseListingFactory *timelapseFactory = [NTKTimelapseListingFactory_cls sharedInstanceForDevice:device];
            NTKTimelapseTheme timelapseTheme = theme - (InterfaceThemeTimelapseSTART + 1);
            
            NSDate *date = [NSDate date];
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(+37.3, -122); // Apple Park
            
            posterImage = [timelapseFactory posterImageWithTheme:timelapseTheme];
            listing = [timelapseFactory listingWithTheme:timelapseTheme date:date location:coord];
            editOption = [NTKTimelapseThemeEditOption_cls optionWithTimelapseTheme:timelapseTheme forDevice:device];
        } break;
            
        case InterfaceThemeFireWaterFire: {
            UIColor *color = [UIColor colorWithRed:0.737255 green:0.419608 blue:0.227451 alpha:1]; // fireListingColor_func();
            NTKFireWaterColor firewaterColor = theme - InterfaceThemeFireWaterSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice_func(@"PosterImage-FireWater-Fullscreen-Fire", device);
            // "Fire_Fullscreen_008", "Fire_Fullscreen_008_Calm"
            listing = [NTKVideoPlayerListing_cls listingForDevice:device withFilename:@"Fire_Fullscreen_008_Calm" andColor:color];
            editOption = [NTKFireWaterColorEditOption_cls optionWithColor:firewaterColor forDevice:device];
        } break;
        case InterfaceThemeFireWaterWater: {
            UIColor *color = [UIColor colorWithRed:0.694118 green:0.690196 blue:0.717647 alpha:1]; // waterListingColor_func();
            NTKFireWaterColor firewaterColor = theme - InterfaceThemeFireWaterSTART;

            posterImage = NTKImageNamedFromAssetsBundleForDevice_func(@"PosterImage-FireWater-Fullscreen-Water", device);
            // "Water_Fullscreen_005", "Water_Fullscreen_005_Edge"
            listing = [NTKVideoPlayerListing_cls listingForDevice:device withFilename:@"Water_Fullscreen_005_Edge" andColor:color];
            editOption = [NTKFireWaterColorEditOption_cls optionWithColor:firewaterColor forDevice:device];
        } break;
            
        case InterfaceThemeMetallicSilver: {
            UIColor *color = [UIColor colorWithRed:0.694118 green:0.690196 blue:0.717647 alpha:1]; // blackAndSilverListingColor_func();
            NTKMetallicColor metallicColor = theme - InterfaceThemeMetallicSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice_func(@"PosterImage-Metallic-Fullscreen-Silver", device);
            listing = [NTKVideoPlayerListing_cls listingForDevice:device withFilename:@"Metallic_Fullscreen_Silver_003" andColor:color];
            editOption = [NTKMetallicColorEditOption_cls optionWithColor:metallicColor forDevice:device];
        } break;
        case InterfaceThemeMetallicBlack: {
            UIColor *color = [UIColor colorWithRed:0.694118 green:0.690196 blue:0.717647 alpha:1]; // blackAndSilverListingColor_func();
            NTKMetallicColor metallicColor = theme - InterfaceThemeMetallicSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice_func(@"PosterImage-Metallic-Fullscreen-Black", device);
            listing = [NTKVideoPlayerListing_cls listingForDevice:device withFilename:@"Metallic_Fullscreen_GunMetal_003" andColor:color];
            editOption = [NTKMetallicColorEditOption_cls optionWithColor:metallicColor forDevice:device];
        } break;
        case InterfaceThemeMetallicGold: {
            UIColor *color = [UIColor colorWithRed:0.705882 green:0.517647 blue:0.407843 alpha:1]; // goldListingColor_func();
            NTKMetallicColor metallicColor = theme - InterfaceThemeMetallicSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice_func(@"PosterImage-Metallic-Fullscreen-Gold", device);
            listing = [NTKVideoPlayerListing_cls listingForDevice:device withFilename:@"Metallic_Fullscreen_Rose_003" andColor:color];
            editOption = [NTKMetallicColorEditOption_cls optionWithColor:metallicColor forDevice:device];
        } break;
            
        case InterfaceThemeSmokeBlueGreen: {
            UIColor *color = [UIColor colorWithRed:0.705882 green:0.517647 blue:0.407843 alpha:1]; // spearmintListingColor_func();
            NTKSmokeColor smokeColor = theme - InterfaceThemeSmokeSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice_func(@"PosterImage-Smoke-Fullscreen-BlueGreen", device);
            listing = [NTKVideoPlayerListing_cls listingForDevice:device withFilename:@"Smoke_Fullscreen_Spearmint_007" andColor:color];
            editOption = [NTKSmokeColorEditOption_cls optionWithColor:smokeColor forDevice:device];
        } break;
        case InterfaceThemeSmokePinkOrange: {
            UIColor *color = [UIColor colorWithRed:0.894118 green:0.372549 blue:0.305882 alpha:1]; // citrusListingColor_func();
            NTKSmokeColor smokeColor = theme - InterfaceThemeSmokeSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice_func(@"PosterImage-Smoke-Fullscreen-PinkOrange", device);
            listing = [NTKVideoPlayerListing_cls listingForDevice:device withFilename:@"Smoke_Fullscreen_Citrus_007" andColor:color];
            editOption = [NTKSmokeColorEditOption_cls optionWithColor:smokeColor forDevice:device];
        } break;
        case InterfaceThemeSmokeBlackWhite: {
            UIColor *color = [UIColor colorWithRed:0.694118 green:0.690196 blue:0.717647 alpha:1]; // neutralListingColor_func();
            NTKSmokeColor smokeColor = theme - InterfaceThemeSmokeSTART;
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice_func(@"PosterImage-Smoke-Fullscreen-BlackWhite", device);
            listing = [NTKVideoPlayerListing_cls listingForDevice:device withFilename:@"Smoke_Fullscreen_Neutral_007" andColor:color];
            editOption = [NTKSmokeColorEditOption_cls optionWithColor:smokeColor forDevice:device];
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
