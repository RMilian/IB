//
//  RRMDraggableView.m
//  WiNK
//
//  Created by flatiron on 9/16/14.
//  Copyright (c) 2014 Ray Milian. All rights reserved.
//

#import "RRMDraggableView.h"
#import "RRMOverlayView.h"
@interface RRMDraggableView ()
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic,) CGPoint originalPoint;
@property (nonatomic, strong) RRMOverlayView *overlayView;

@end
@implementation RRMDraggableView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
            
            self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragged:)];
            [self addGestureRecognizer:self.panGestureRecognizer];
            
            [self loadImageAndStyle];

            self.overlayView = [[RRMOverlayView alloc] initWithFrame:self.bounds];
            self.overlayView.alpha = 0;
            [self addSubview:self.overlayView];
            
            return self;
        }
    
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


/*
    THIS IS // OUT BUT WOULD BE THE BLANK BOX BEHIND IT
 - (id)init
{
    self = [super init];
    if (!self) return nil;
    
    self.backgroundColor = [UIColor greenColor];
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragged:)];
    [self addGestureRecognizer:self.panGestureRecognizer];
    
    [self loadImageAndStyle];
    
    return self;
}
*/
- (void)loadImageAndStyle
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"imagesWink.jpeg"]];
    [self addSubview:imageView];
    self.layer.cornerRadius = 8;
    self.layer.shadowOffset = CGSizeMake(7, 7);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
}


//- (void)dragged:(UIGestureRecognizer *)gestureRecognizer
//{
//    // TODO: Write Logic
//}

- (void)dealloc
{
    [self removeGestureRecognizer:self.panGestureRecognizer];
}
- (void)dragged:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGFloat xDistance = [gestureRecognizer translationInView:self].x;
    CGFloat yDistance = [gestureRecognizer translationInView:self].y;
    
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:{
           self.originalPoint = self.center;
            break;
        };
        case UIGestureRecognizerStateChanged:{
            CGFloat rotationStrength = MIN(xDistance / 320, 1);
            CGFloat rotationAngel = (CGFloat) (2*M_PI * rotationStrength / 16);
            CGFloat scaleStrength = 1 - fabsf(rotationStrength) / 4;
            CGFloat scale = MAX(scaleStrength, 0.93);
            self.center = CGPointMake(self.originalPoint.x + xDistance, self.originalPoint.y + yDistance);
            CGAffineTransform transform = CGAffineTransformMakeRotation(rotationAngel);
            CGAffineTransform scaleTransform = CGAffineTransformScale(transform, scale, scale);
            self.transform = scaleTransform;
            
            break;
        };
        case UIGestureRecognizerStateEnded: {
            [self resetViewPositionAndTransformations];
            break;
        };
        case UIGestureRecognizerStatePossible:break;
        case UIGestureRecognizerStateCancelled:break;
        case UIGestureRecognizerStateFailed:break;
    }
}

- (void)resetViewPositionAndTransformations
{
    [UIView animateWithDuration:0.2
                     animations:^{
                        self.center = self.originalPoint;
                         self.transform = CGAffineTransformMakeRotation(0);
                     }];
}




- (void)updateOverlay:(CGFloat)distance
{
    if (distance > 0) {
        self.overlayView.mode = GGOverlayViewModeRight;
    } else if (distance <= 0) {
        self.overlayView.mode = GGOverlayViewModeLeft;
    }
    CGFloat overlayStrength = MIN(fabsf(distance) / 100, 0.4);
    self.overlayView.alpha = overlayStrength;
}
//----------\\




@end
