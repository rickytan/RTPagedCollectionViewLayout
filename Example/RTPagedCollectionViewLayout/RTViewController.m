//
//  RTViewController.m
//  RTPagedCollectionViewLayout
//
//  Created by rickytan on 03/29/2016.
//  Copyright (c) 2016 rickytan. All rights reserved.
//

@import RTPagedCollectionViewLayout;

#import "RTViewController.h"

@interface RTCollectionLabledCell : UICollectionViewCell
@property (nonatomic, weak) IBOutlet UILabel *label;
@end

@implementation RTCollectionLabledCell
@end

@interface RTViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation RTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 33;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RTCollectionLabledCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                           forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d", (int)indexPath.item];
    return cell;
}

@end
