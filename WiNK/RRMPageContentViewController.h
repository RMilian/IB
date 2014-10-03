//
//  RRMPageViewController.h
//  WiNK
//
//  Created by flatiron on 10/1/14.
//  Copyright (c) 2014 Ray Milian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRMPageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property NSInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@end
