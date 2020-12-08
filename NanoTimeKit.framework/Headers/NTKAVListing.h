//
//  NTKAVListing.h
//  NanoTimeKit
//
//  Created by Leptos on 12/7/20.
//

#import "CLKVideo.h"

@protocol NTKAVListing <NSObject>

@property (readonly, nonatomic) CLKVideo *video;
@property (readonly, nonatomic) UIImage *image;

- (BOOL)snapshotDiffers:(id<NTKAVListing>)other;
- (void)discardAssets;

@end
