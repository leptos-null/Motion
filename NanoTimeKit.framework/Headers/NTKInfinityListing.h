//
//  NTKInfinityListing.h
//  NanoTimeKit
//
//  Created by Leptos on 12/10/20.
//

#import <NanoTimeKit/NTKAVListing.h>
#import <NanoTimeKit/NTKInfinityListingAttributes.h>

typedef NS_ENUM(NSUInteger, NTKInfinityType) {
    NTKInfinityTypeA, // near-still portraits (main characters only)
    NTKInfinityTypeB, // quick movements (main characters only)
    NTKInfinityTypeC, // character starts on screen, and ends off screen (main characters only)
    NTKInfinityTypeD, // character starts off screen, and ends off screen (Buzz only)
    NTKInfinityTypeE, // everything else (all characters)
};

// based on -[NTKInfinityFaceView videoPlayerViewDidPauseAfterPlayingVideoToEnd:] behavior
typedef NS_ENUM(NSUInteger, NTKInfinityPlayback) {
    NTKInfinityPlaybackNext, // play next
    NTKInfinityPlaybackFade, // fade out
    NTKInfinityPlaybackLoop, // play again
};

/*
 * NTKInfinityPlayback defaultPlaybackForType(NTKInfinityType type) {
 *     switch (type) {
 *         case NTKInfinityTypeB:
 *             return NTKInfinityPlaybackPlayNext;
 *         case NTKInfinityTypeC:
 *         case NTKInfinityTypeD:
 *         case NTKInfinityTypeE:
 *             return NTKInfinityPlaybackFade;
 *         default:
 *             return NTKInfinityPlaybackLoop;
 *     }
 * }
 */

@interface NTKInfinityListing : NSObject <NSCopying, NTKAVListing>

@property (nonatomic) NTKInfinityType type;
@property (nonatomic) NTKInfinityPlayback playback;
@property (retain, nonatomic) NTKInfinityListingAttributes *attributes;

+ (instancetype)listingForDevice:(CLKDevice *)device withFilename:(NSString *)filename;
+ (instancetype)listingForDevice:(CLKDevice *)device withFilename:(NSString *)filename type:(NTKInfinityType)type attributes:(NTKInfinityListingAttributes *)attributes;

- (instancetype)initForDevice:(CLKDevice *)device withFilename:(NSString *)filename;

- (UIColor *)complicationColor;

@end
