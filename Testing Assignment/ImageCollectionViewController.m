//
//  ImageCollectionViewController.m
//  Testing Assignment
//
//  Created by Admin on 25/08/16.
//  Copyright © 2016 Elantix. All rights reserved.
//

#import "ImageCollectionViewController.h"

@interface ImageCollectionViewController () {

    NSMutableArray *arrayOfImages;
}
@end

@implementation ImageCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    arrayOfImages = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 9; i++) {
        NSURL *animatedImageUrl = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"gifs/giphy_%d", i] withExtension:@"gif"];
        NSData *animatedImageData = [NSData dataWithContentsOfURL:animatedImageUrl];
        [arrayOfImages addObject:animatedImageData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrayOfImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:[arrayOfImages objectAtIndex:indexPath.row]];
    FLAnimatedImageView *animatedImageView = (FLAnimatedImageView *)[cell viewWithTag:99];
    animatedImageView.animatedImage = animatedImage;
    
    return cell;
}

@end
