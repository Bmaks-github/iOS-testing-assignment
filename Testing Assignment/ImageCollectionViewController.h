//
//  ImageCollectionViewController.h
//  Testing Assignment
//
//  Created by Admin on 25/08/16.
//  Copyright © 2016 Elantix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImage.h"

@interface ImageCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet FLAnimatedImageView *animatedImageView;

@end
