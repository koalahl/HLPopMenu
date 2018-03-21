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
    UIView *centerv = nil;
    if (self.centerBtn) {
        self.centerBtn.selected = !self.centerBtn.isSelected;
        centerv = self.centerBtn;
    }else if (self.centerView){
        centerv = self.centerView;
    }
    
    self.expanded = !self.isExpanded;
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectMenu:)]) {
        [self.delegate didSelectMenu:self];
    }
    NSInteger k = 0;
    if (self.isExpanded == false) {
        [self close];
        return;
    }
    {
        //open animation
        if (self.items.count > 1) {
            for (UIButton *btn in self.items) {
                k = btn.tag - 10000;
                
                [UIView animateWithDuration:self.animationTimeInterval animations:^{
                   
                     btn.center = CGPointMake(self.distance *  cos((k-1) * self.angleScope / (self.count - 1) + self.startAngle) + centerv.center.x, centerv.center.y - self.distance *  sin((k-1) * self.angleScope / (self.count - 1) + self.startAngle));
                   
                } completion:^(BOOL finished) {
                    
                }];
            }
        }
    }
}

- (void)close {
    if (self.isExpanded == true) {
        return;
    }
    NSInteger k = 0;
    //animation
    for (UIButton *btn in self.items) {
        k = btn.tag - 10000;
        
        [UIView animateWithDuration:self.animationTimeInterval animations:^{
            
            btn.center = self.centerBtn?self.centerBtn.center:self.centerView.center;
            
        } completion:^(BOOL finished) {
            
        }];
    }
}


@end
