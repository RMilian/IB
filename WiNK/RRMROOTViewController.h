//
//  RRMROOTViewController.h
//  WiNK
//
//  Created by flatiron on 10/1/14.
//  Copyright (c) 2014 Ray Milian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRMROOTViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

@end
