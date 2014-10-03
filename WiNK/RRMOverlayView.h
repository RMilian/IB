//
//  RRMOverlayView.h
//  WiNK
//
//  Created by flatiron on 9/17/14.
//  Copyright (c) 2014 Ray Milian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface RRMOverlayView : UIView
typedef NS_ENUM(NSUInteger , GGOverlayViewMode) {
    GGOverlayViewModeLeft,
    GGOverlayViewModeRight
};

@property (nonatomic) GGOverlayViewMode mode;
@end