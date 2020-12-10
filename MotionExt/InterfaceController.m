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

FOUNDATION_EXTERN UIImage *NTKImageNamedFromAssetsBundleForDevice(NSString *name, CLKDevice *device);

NS_INLINE NSInteger NSIntegerRotate(NSInteger min, NSInteger x, NSInteger max) {
    if (x < min) {
        return max;
    }
    if (x > max) {
        return min;
    }
    return x;
}

@implementation InterfaceController

- (void)awakeWithContext:(NSNumber *)context {
    self.theme = context.unsignedIntegerValue;
}

- (void)setTheme:(InterfaceTheme)theme {
    _theme = theme;
    _variant = 0; // use 0 as a default value
    
    [self _reloadFromThemeVariant];
}

- (void)setVariant:(NSInteger)variant {
    if (variant == self.variant) {
        return;
    }
    switch (self.theme) {
        case InterfaceThemeVideoButterfly:
            variant = NSIntegerRotate(1, variant, 25);
            break;
        case InterfaceThemeVideoJellyfish:
            variant = NSIntegerRotate(26, variant, 44);
            break;
        case InterfaceThemeVideoFlower:
            variant = NSIntegerRotate(45, variant, 52);
            break;
            
        case InterfaceThemeTimelapseMackLake:
            variant = NSIntegerRotate(1, variant, 22);
            break;
        case InterfaceThemeTimelapseNewYork:
            variant = NSIntegerRotate(1, variant, 20);
            break;
        case InterfaceThemeTimelapseHongKong:
            variant = NSIntegerRotate(1, variant, 26);
            break;
        case InterfaceThemeTimelapseLondon:
            variant = NSIntegerRotate(1, variant, 16);
            break;
        case InterfaceThemeTimelapseParis:
            variant = NSIntegerRotate(1, variant, 17);
            break;
        case InterfaceThemeTimelapseShanghai:
            variant = NSIntegerRotate(1, variant, 22);
            break;
            
        case InterfaceThemeFireWaterFire:
        case InterfaceThemeFireWaterWater:
            variant = NSIntegerRotate(1, variant, 2);
            break;
        default:
            variant = 1;
            break;
    }
    
    _variant = variant;
    
    [self _reloadFromThemeVariant];
}

- (void)_reloadFromThemeVariant {
    InterfaceTheme theme = self.theme;
    NSInteger variant = self.variant;
    
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
            
            if (variant == 0) {
                NTKVideoListing *videoListing = [videoFactory defaultListingWithTheme:videoTheme];
                
                posterImage = [videoFactory posterImageWithTheme:videoTheme];
                listing = videoListing;
                _variant = videoListing.variant;
            } else {
                // we don't want the default poster to flash between videos, show black instead
                // "motion-black" assets seem to be missing on some devices?
                posterImage = NTKImageNamedFromAssetsBundleForDevice(@"motion-black", device);
                listing = [videoFactory anyListingWithTheme:videoTheme variant:variant tag:0];
            }
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
            NTKTimelapseThemeEditOption *timelapseEditOption = [NTKTimelapseThemeEditOption optionWithTimelapseTheme:timelapseTheme forDevice:device];
            
            NTKTimelapseListing *timelapseListing = nil;
            if (variant == 0) {
                NSDate *date = [NSDate date];
                CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(+37.3, -122); // Apple Park
                
                timelapseListing = [timelapseFactory listingWithTheme:timelapseTheme date:date location:coord];
                
                listing = timelapseListing;
                _variant = timelapseListing.videoIndex;
            } else {
                timelapseListing = [[NTKTimelapseListing alloc] initForDevice:device withTheme:timelapseTheme videoIndex:variant photoAnalysis:nil];
            }
            // timelapseFactory.posterImageWithTheme has a similar problem to Video,
            //   where the poster is going to flash when incrementing the videoIndex.
            // to make this more seemless, use the image associated with the listing
            NSString *resourceName = [timelapseEditOption resourceNameWithVideoIndex:timelapseListing.videoIndex];
            // timelapseFactory.heroImageWithTheme uses "-hero" only, which is too small
            posterImage = NTKImageNamedFromAssetsBundleForDevice([resourceName stringByAppendingString:@"-hero-all-alchemy"], device);
            listing = timelapseListing;
            editOption = timelapseEditOption;
        } break;
            
        case InterfaceThemeFireWaterFire: {
            NTKFireWaterColor firewaterColor = theme - InterfaceThemeFireWaterSTART;
            NSString *filename = nil;
            switch (variant) {
                case 1:
                    filename = @"Fire_Fullscreen_008";
                    break;
                default:
                    filename = @"Fire_Fullscreen_008_Calm";
                    break;
            }
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice(@"PosterImage-FireWater-Fullscreen-Fire", device);
            listing = [NTKVideoPlayerListing listingForDevice:device withFilename:filename];
            editOption = [NTKFireWaterColorEditOption optionWithColor:firewaterColor forDevice:device];
        } break;
        case InterfaceThemeFireWaterWater: {
            NTKFireWaterColor firewaterColor = theme - InterfaceThemeFireWaterSTART;
            NSString *filename = nil;
            switch (variant) {
                case 1:
                    filename = @"Water_Fullscreen_005";
                    break;
                default:
                    filename = @"Water_Fullscreen_005_Edge";
                    break;
            }
            
            posterImage = NTKImageNamedFromAssetsBundleForDevice(@"PosterImage-FireWater-Fullscreen-Water", device);
            listing = [NTKVideoPlayerListing listingForDevice:device withFilename:filename];
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

- (IBAction)movieTapGesture:(WKTapGestureRecognizer *)sender {
    if (sender.state != WKGestureRecognizerStateEnded) {
        return;
    }
    self.variant++;
    [self.inlineMovie playFromBeginning];
}

@end
