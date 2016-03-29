//
//  RTPagedCollectionViewLayout.m
//  Pods
//
//  Copyright (c) 2016 rickytan <ricky.tan.xin@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "RTPagedCollectionViewLayout.h"

@interface RTPagedCollectionViewLayout ()
@property (nonatomic, strong) NSArray <UICollectionViewLayoutAttributes *> *allAttributes;
@end

@implementation RTPagedCollectionViewLayout

- (void)_commonInit
{
    self.columns = 4;
    self.rows = 2;
    self.itemSize = CGSizeMake(64, 64);
    self.edgeInsets = UIEdgeInsetsMake(8, 8, 8, 8);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (void)setColumns:(NSUInteger)columns
{
    if (_columns != columns) {
        _columns = columns;
        [self invalidateLayout];
    }
}

- (void)setRows:(NSUInteger)rows
{
    if (_rows != rows) {
        _rows = rows;
        [self invalidateLayout];
    }
}

- (void)setItemSize:(CGSize)itemSize
{
    if (!CGSizeEqualToSize(_itemSize, itemSize)) {
        _itemSize = itemSize;
        [self invalidateLayout];
    }
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets
{
    if (!UIEdgeInsetsEqualToEdgeInsets(_edgeInsets, edgeInsets)) {
        _edgeInsets = edgeInsets;
        [self invalidateLayout];
    }
}

- (void)prepareLayout
{
    [super prepareLayout];
    if (!self.columns || !self.rows)
        return;
    
    CGRect rect = UIEdgeInsetsInsetRect(self.collectionView.bounds, self.edgeInsets);
    CGFloat offsetX = self.edgeInsets.left;
    CGFloat offsetY = self.edgeInsets.top;
    
    CGFloat marginX = 0.f;
    if (self.columns == 1) {
        offsetX += (CGRectGetWidth(rect) - self.itemSize.width) / 2;
    }
    else {
        marginX = (CGRectGetWidth(rect) - self.columns * self.itemSize.width) / (self.columns - 1);
    }
    
    CGFloat marginY = 0.f;
    if (self.rows == 1) {
        offsetY += (CGRectGetHeight(rect) - self.itemSize.height) / 2;
    }
    else {
        marginY = (CGRectGetHeight(rect) - self.rows * self.itemSize.height) / (self.rows - 1);
    }
    NSInteger pageSize = self.rows * self.columns;
    
    NSMutableArray *arr = [NSMutableArray array];
    
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < numberOfItems; ++i) {
        
        NSInteger page = i / pageSize;
        NSInteger col = (i % pageSize) % self.columns;
        NSInteger row = (i % pageSize) / self.columns;
        
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i
                                                                                                                                            inSection:0]];
        //attr.size = self.itemSize;
        //attr.center = CGPointMake(self.collectionView.width * page + (marginX + self.itemSize.width) * col + marginX, (marginY + self.itemSize.height) * row + marginY);
        
        attr.frame = CGRectMake(offsetX + CGRectGetWidth(self.collectionView.bounds) * page + (marginX + self.itemSize.width) * col,
                                offsetY + (marginY + self.itemSize.height) * row,
                                self.itemSize.width, self.itemSize.height);
        
        [arr addObject:attr];
    }
    self.allAttributes = [NSArray arrayWithArray:arr];
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *arr = [NSMutableArray array];
    [self.allAttributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectIntersectsRect(rect, obj.frame))
            [arr addObject:obj];
    }];
    return arr;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.allAttributes[indexPath.item];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (CGSize)collectionViewContentSize
{
    CGSize size = self.collectionView.bounds.size;
    
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    NSInteger count = [self.collectionView.dataSource collectionView:self.collectionView
                                              numberOfItemsInSection:0];
    NSInteger pageSize = self.rows * self.columns;
    
    CGSize newSize = CGSizeMake(((count + pageSize - 1) / pageSize) * collectionViewWidth, size.height);
    
    return newSize;
}

@end
