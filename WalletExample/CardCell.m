//
//  CardCell.m
//  WalletExample
//
//  Created by Jonathan Yeung on 2017-05-20.
//  Copyright © 2017 Jonathan Yeung. All rights reserved.
//

#import "CardCell.h"
#import "Chameleon.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface CardCell ()
@property (weak, nonatomic) IBOutlet UIView *cardContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *creditCardImageView;
@property (weak, nonatomic) IBOutlet UIButton *creditCardButton;

@end

@implementation CardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self styleViews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.cardContainerView.frame].CGPath;
}

- (void)styleViews {
    self.cardContainerView.layer.cornerRadius = 10;
    
    self.creditCardImageView.layer.shadowOffset = CGSizeMake(0, 2);
    self.creditCardImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.creditCardImageView.layer.shadowOpacity = 0.2;
    self.creditCardImageView.layer.shadowRadius = 6;
    self.creditCardImageView.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.creditCardImageView.bounds].CGPath;
    
    self.contentView.layer.shadowOffset = CGSizeMake(0, 0);
    self.contentView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.contentView.layer.shadowOpacity = 0.2;
    self.contentView.layer.shadowRadius = 6;
}

- (void)applyOffsetWithScrollView:(UIScrollView *)scrollView {

}

- (void)configureWithBlue {
    self.creditCardImageView.image = [UIImage imageNamed:@"creditcard-blue"];
    self.creditCardButton.backgroundColor = [UIColor flatBlueColorDark];
}

- (void)configureWithPurple {
    self.creditCardImageView.image = [UIImage imageNamed:@"creditcard-purple"];
    self.creditCardButton.backgroundColor = [UIColor flatPlumColor];
}

+ (CGSize)sizeWithWidth:(CGFloat)width {
    return CGSizeMake(width, 380);
}

@end
