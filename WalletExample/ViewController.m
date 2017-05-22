//
//  ViewController.m
//  WalletExample
//
//  Created by Jonathan Yeung on 2017-05-20.
//  Copyright © 2017 Jonathan Yeung. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "Chameleon.h"
#import "CardCell.h"
#import "ParticleScene.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet SKView *particleBackgroundView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
    self.view.backgroundColor = [UIColor flatPowderBlueColorDark];
    ParticleScene *scene = [ParticleScene sceneWithSize:self.particleBackgroundView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    self.particleBackgroundView.backgroundColor = [UIColor clearColor];
    self.particleBackgroundView.allowsTransparency = YES;
    [self.particleBackgroundView presentScene:scene];
}

- (void)setupCollectionView {
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    UINib *cardNib = [UINib nibWithNibName:NSStringFromClass([CardCell class]) bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:cardNib forCellWithReuseIdentifier:NSStringFromClass([CardCell class])];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CardCell class]) forIndexPath:indexPath];
    if (indexPath.item == 0) {
        [cell configureWithBlue];
    } else {
        [cell configureWithPurple];
    }
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [CardCell sizeWithWidth:collectionView.frame.size.width];
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentIndex = self.collectionView.contentOffset.x / self.collectionView.frame.size.width;
    UIColor *color;
    if (currentIndex == 0) {
        color = [UIColor flatPowderBlueColorDark];
    } else {
        color = UIColorFromRGB(0xB4A5DE);
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.view.backgroundColor = color;
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    for (CardCell *cell in [self.collectionView visibleCells]) {
//        [cell applyOffsetWithScrollView:scrollView];
//    }
    CardCell *cell = [[self.collectionView visibleCells] firstObject];
    [cell applyOffsetWithScrollView:scrollView];
}

@end
