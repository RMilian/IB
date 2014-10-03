//
//  RRMOverlayView.m
//  WiNK
//
//  Created by flatiron on 9/17/14.
//  Copyright (c) 2014 Ray Milian. All rights reserved.
//

#import "RRMOverlayView.h"


@interface RRMOverlayView ()
@property (nonatomic, strong) UIImageView *imageView;
@end


@implementation RRMOverlayView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/




- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;

    self.backgroundColor = [UIColor whiteColor];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trollface_300x200"]];
    [self addSubview:self.imageView];
    
    return self;
}


- (void)setMode:(GGOverlayViewMode)mode
{
    if (_mode == mode) return;
    
    _mode = mode;
    if (mode == GGOverlayViewModeLeft) {
        self.imageView.image = [UIImage imageNamed:@"trollface_300x200"];
    } else {
        self.imageView.image = [UIImage imageNamed:@"thumbs_up_300x300"];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(50, 50, 100, 100);
}


@end
