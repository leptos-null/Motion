//
//  NTKInfinityDataSource.h
//  NanoTimeKit
//
//  Created by Leptos on 12/10/20.
//

#import <NanoTimeKit/NTKInfinityListing.h>

typedef NS_ENUM(NSUInteger, NTKInfinityCharacterType) {
    NTKInfinityCharacterTypeBuzz,
    NTKInfinityCharacterTypeWoody,
    NTKInfinityCharacterTypeJessie,
    NTKInfinityCharacterTypeSupporting, // Alien, Hamm, Rex, Buzz & Woody, Bullseye
};

OBJC_EXTERN NSString *NSStringFromNTKInfinityCharacterType(NTKInfinityCharacterType character);


@interface NTKInfinityDataSource : NSObject

+ (UIColor *)buzzColor;
+ (UIColor *)woodyColor;
+ (UIColor *)jessieColor;
+ (UIColor *)ballColor;
+ (UIColor *)hangGliderColor;
+ (UIColor *)bullseyeColor;
+ (UIColor *)supportingCastColor;
+ (UIColor *)rexColor;
+ (UIColor *)hammColor;
+ (UIColor *)alienColor;
+ (UIColor *)spotlightColor;


@property (nonatomic) NSInteger numberOfTotalActions;
@property (nonatomic) NSInteger numberOfTotalMagicMoments;

- (instancetype)initForDevice:(CLKDevice *)device;

- (NSArray<NTKInfinityListing *> *)listingsForCharacter:(NTKInfinityCharacterType)character;
// types refers to NTKInfinityType
- (NSArray<NTKInfinityListing *> *)listingsForCharacter:(NTKInfinityCharacterType)character ofTypes:(NSArray<NSNumber *> *)types withAttributes:(NTKInfinityListingAttributes *)attributes recentlyUsed:(NSArray<NTKInfinityListing *> *)recentlyUsed;
// types refers to NTKInfinityType
- (NSArray<NTKInfinityListing *> *)listingsOfTypes:(NSArray<NSNumber *> *)types withAttributes:(NTKInfinityListingAttributes *)attributes recentlyUsed:(NSArray<NTKInfinityListing *> *)recentlyUsed;

@end

/* my reverse engineered implementation of _makeInfinityListingWithPlayback to better understand Infinity components
 *
 * NTKInfinityListing *_makeInfinityListingWithPlayback(NTKInfinityCharacterType character, NSString *subname, NTKInfinityType type, UIColor *color,
 *                                                      NSUInteger crop, NSUInteger setting, NTKInfinityPlayback playback, CLKDevice *device) {
 *     NSString *characterName = nil;
 *     switch (character) {
 *         case NTKInfinityCharacterTypeBuzz:
 *             characterName = @"Buzz";
 *             break;
 *         case NTKInfinityCharacterTypeWoody:
 *             characterName = @"Woody";
 *             break;
 *         case NTKInfinityCharacterTypeJessie:
 *             characterName = @"Jessie";
 *             break;
 *         case NTKInfinityCharacterTypeSupporting:
 *             characterName = @"Supporting";
 *             break;
 *     }
 *
 *     NSString *filename = [NSString stringWithFormat:@"%@_%@_%@", @"Infinity", characterName, subname];
 *     NTKInfinityListing *listing = [NTKInfinityListing listingForDevice:device withFilename:filename];
 *     listing.type = type;
 *     listing.playback = playback;
 *
 *     NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
 *     attributes[@"character"] = [NSNumber numberWithUnsignedInteger:character];
 *     attributes[@"color"] = color;
 *
 *     if (crop != 0x0) {
 *         attributes[@"crop"] = [NSNumber numberWithUnsignedInteger:crop];
 *     }
 *     if (setting != 0x0) {
 *         attributes[@"setting"] = [NSNumber numberWithUnsignedInteger:setting];
 *     }
 *     listing.attributes = [NTKInfinityListingAttributes attributesWithDictionary:attributes];
 *
 *     return listing;
 * }
 */

/* my reverse engineered implementation of _makeInfinityListing to better understand Infinity components
 *
 * NTKInfinityListing *_makeInfinityListing(NTKInfinityCharacterType character, NSString *subname, NTKInfinityType type, UIColor *color,
 *                                          NSUInteger crop, NSUInteger setting, CLKDevice *device) {
 *     NTKInfinityPlayback playback = NTKInfinityPlaybackLoop;
 *     NSUInteger lookupIndex = character - 1;
 *     if (lookupIndex < 4) {
 *         NTKInfinityPlayback playbackLookup[4] = {
 *             NTKInfinityPlaybackNext,
 *             NTKInfinityPlaybackFade,
 *             NTKInfinityPlaybackFade,
 *             NTKInfinityPlaybackFade,
 *         };
 *         playback = playbackLookup[lookupIndex];
 *     }
 *     return _makeInfinityListingWithPlayback(character, subname, type, color, crop, setting, playback, device);
 * }
 *
 */
