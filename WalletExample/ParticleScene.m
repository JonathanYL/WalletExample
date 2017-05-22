//
//  ParticleScene.m
//  WalletExample
//
//  Created by Jonathan Yeung on 2017-05-21.
//  Copyright © 2017 Jonathan Yeung. All rights reserved.
//

#import "ParticleScene.h"

@implementation ParticleScene

- (id)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [SKColor clearColor];
        NSString *emitterPath = [[NSBundle mainBundle] pathForResource:@"Fireflies" ofType:@"sks"];
        SKEmitterNode *bokeh = [NSKeyedUnarchiver unarchiveObjectWithFile:emitterPath];
        bokeh.position = CGPointMake(CGRectGetMidX(self.frame), self.size.height/2);
        bokeh.name = @"particleFireflies";
        bokeh.targetNode = self.scene;
        [self addChild:bokeh];
    }
    return self;
}
@end
