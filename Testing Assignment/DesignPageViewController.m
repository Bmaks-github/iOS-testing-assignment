//
//  DesignPageViewController.m
//  Testing Assignment
//
//  Created by Admin on 29/08/16.
//  Copyright © 2016 Elantix. All rights reserved.
//

#import "DesignPageViewController.h"

@interface DesignPageViewController ()

@end

@implementation DesignPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Make picture circular
    self.userProfileImageView.layer.cornerRadius = self.userProfileImageView.frame.size.width / 2;
    self.userProfileImageView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
