//
//  NTKPhotoAnalysis.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import <Foundation/Foundation.h>

typedef struct {
    BOOL isComplexBackground;
    BOOL isColoredText;
    float textHue;
    float textSaturation;
    float textBrightness;
    float bgHue;
    float bgSaturation;
    float bgBrightness;
    float shadowHue;
    float shadowSaturation;
    float shadowBrightness;
} NTKPhotoAnalysisStructure;

@interface NTKPhotoAnalysis : NSObject <NSCopying, NSSecureCoding>

@property (readonly, nonatomic, getter=isComplexBackground) BOOL complexBackground;
@property (readonly, nonatomic, getter=isColoredText) BOOL coloredText;
@property (readonly, nonatomic) float textHue;
@property (readonly, nonatomic) float textSaturation;
@property (readonly, nonatomic) float textBrightness;
@property (readonly, nonatomic) float bgHue;
@property (readonly, nonatomic) float bgSaturation;
@property (readonly, nonatomic) float bgBrightness;
@property (readonly, nonatomic) float shadowHue;
@property (readonly, nonatomic) float shadowSaturation;
@property (readonly, nonatomic) float shadowBrightness;
@property (readonly, nonatomic) NTKPhotoAnalysisStructure structure;
@property (readonly, nonatomic) unsigned int version;


+ (instancetype)defaultAnalysis;
+ (instancetype)invalidAnalysis;

+ (BOOL)isValidDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)encodeAsDictionary;

- (instancetype)initFromDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithStructure:(NTKPhotoAnalysisStructure)structure;

@end
