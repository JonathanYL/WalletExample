//
//  CardCell.h
//  WalletExample
//
//  Created by Jonathan Yeung on 2017-05-20.
//  Copyright © 2017 Jonathan Yeung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCell : UICollectionViewCell

+ (CGSize)sizeWithWidth:(CGFloat)width;
- (void)applyOffsetWithScrollView:(UIScrollView *)scrollView;
- (void)configureWithBlue;
- (void)configureWithPurple;

@end
