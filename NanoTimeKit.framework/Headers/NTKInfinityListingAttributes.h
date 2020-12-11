//
//  NTKInfinityListingAttributes.h
//  NanoTimeKit
//
//  Created by Leptos on 12/10/20.
//

#import <Foundation/Foundation.h>

typedef NSString *NTKInfinityListingAttributeKey NS_EXTENSIBLE_STRING_ENUM;

OBJC_EXTERN NTKInfinityListingAttributeKey const kInfinityListingAttributesKeyCharacter; // NSNumber containing NTKInfinityCharacter
OBJC_EXTERN NTKInfinityListingAttributeKey const kInfinityListingAttributesKeyColor; // UIColor of complicationColor
OBJC_EXTERN NTKInfinityListingAttributeKey const kInfinityListingAttributesKeyCrop; // NSNumber
OBJC_EXTERN NTKInfinityListingAttributeKey const kInfinityListingAttributesKeySetting; // NSNumber
OBJC_EXTERN NTKInfinityListingAttributeKey const kInfinityListingAttributesKeyListingType;


@interface NTKInfinityListingAttributes : NSObject

@property (retain, nonatomic) NSMutableDictionary<NTKInfinityListingAttributeKey, id> *attributes;

+ (instancetype)attributesWithDictionary:(NSDictionary<NTKInfinityListingAttributeKey, id> *)dictionary;

- (UIColor *)colorForKey:(NSString *)key;

- (void)addAttribute:(id)attribute forKey:(NTKInfinityListingAttributeKey)key;
- (BOOL)containsAttributes:(NTKInfinityListingAttributes *)attributes ignoreKeys:(NSArray<NTKInfinityListingAttributeKey> *)keys;

@end
