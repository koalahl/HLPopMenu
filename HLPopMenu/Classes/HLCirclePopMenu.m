//
//  HLCirclePopMenu.m
//  Yeyu
//
//  Created by HanLiu on 2017/2/7.
//  Copyright © 2017年 mobilenowgroup. All rights reserved.
//

#import "HLCirclePopMenu.h"


@interface HLCirclePopMenu ()


@property (nonatomic,assign) NSInteger count;
@end
@implementation HLCirclePopMenu

- (void)config{
    self.startAngle = 0;
    self.angleScope = M_PI/2;
    self.animationTimeInterval = 0.25;
}

#pragma mark - 点击事件
- (void)open {
    self.centerBtn.selected = !self.centerBtn.isSelected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectCenterBtn:inMenu:)]) {
        [self.delegate didSelectCenterBtn:self.centerBtn inMenu:self];
    }
    NSInteger k = 0;
    if (self.isExpanded == true) {
        [self close];
        return;
    }
    {
        //open animation
        if (self.items.count > 1) {
            for (UIButton *btn in self.items) {
                k = btn.tag - 10000;
                
                [UIView animateWithDuration:self.animationTimeInterval animations:^{
                   
                     btn.center = CGPointMake(self.distance *  cos((k-1) * self.angleScope / (self.count - 1) + self.startAngle) + self.centerBtn.center.x, self.centerBtn.center.y - self.distance *  sin((k-1) * self.angleScope / (self.count - 1) + self.startAngle));
                   
                } completion:^(BOOL finished) {
                    
                }];
                
            }
        }
    }
    
    self.expanded = !self.isExpanded;
}

- (void)close {
    if (self.isExpanded == false) {
        return;
    }
    NSInteger k = 0;
    //animation
    for (UIButton *btn in self.items) {
        k = btn.tag - 10000;
        
        [UIView animateWithDuration:self.animationTimeInterval animations:^{
            
            btn.center = self.centerBtn.center;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    self.expanded = !self.isExpanded;
}


@end
