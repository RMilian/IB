//
//  RRMView.m
//  WiNK
//
//  Created by flatiron on 9/17/14.
//  Copyright (c) 2014 Ray Milian. All rights reserved.
//

#import "RRMView.h"
#import "RRMDraggableView.h"
@interface RRMView ()
@property (nonatomic, strong) RRMDraggableView *draggableView;
@end

@implementation RRMView

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self loadDraggableCustomView];
        
        // Initialization code
        
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"somethinh");
        // Initialization code
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
- (id)init
{
    NSLog(@"somethinh");
    self = [super init];
    if (!self) return nil;
    
    
    
    return self;
}

- (void)loadDraggableCustomView
{
    self.draggableView = [[RRMDraggableView alloc] init];
    [self addSubview:self.draggableView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.draggableView.frame = CGRectMake(60, 60, 200, 260);
}


@end
