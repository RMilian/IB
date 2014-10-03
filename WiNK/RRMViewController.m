//
//  RRMViewController.m
//  WiNK
//
//  Created by flatiron on 9/16/14.
//  Copyright (c) 2014 Ray Milian. All rights reserved.
//

#import "RRMViewController.h"
#import "RRMDraggableView.h" 
@interface RRMViewController () <UINavigationControllerDelegate>
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) RRMDraggableView *draggableView;
@end

@implementation RRMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"ASDF");
	// Do any additional setup after loading the view, typically from a nib.
    
    UINavigationController *navController = self.navigationController;
    navController.delegate = self;
    
    navController.navigationBar.barTintColor = [UIColor colorWithRed:.2
                                                               green:.4
                                                                blue:.9
                                                               alpha:1];
    
    CGSize navBarSize = navController.navigationBar.bounds.size;
    CGPoint origin = CGPointMake( navBarSize.width/2, navBarSize.height/2 );
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(origin.x, origin.y,
                                                                       0, 0)];
    
    //Or whatever number of viewcontrollers you have
    [self.pageControl setNumberOfPages:2];
    
    [navController.navigationBar addSubview:self.pageControl];
    
    navController.delegate = self;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    int index = [navigationController.viewControllers indexOfObject:viewController];
    self.pageControl.currentPage = index;
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
