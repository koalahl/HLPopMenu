//
//  HLLinerPopMenu.m
//  HLCirclyMenu
//
//  Created by HanLiu on 2018/3/19.
//

#import "HLLinerPopMenu.h"

@interface HLLinerPopMenu ()

@end

@implementation HLLinerPopMenu

#pragma mark -- 点击事件
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
                CGPoint destPoint = CGPointZero;
                switch (self.direction) {
                    case HLLinerPopMenuDirectionUp:
                        destPoint = CGPointMake( centerv.center.x, centerv.center.y - self.distance * k/2);
                        break;
                    case HLLinerPopMenuDirectionDown:
                        destPoint = CGPointMake( centerv.center.x, centerv.center.y + self.distance * k/2);
                        break;
                    case HLLinerPopMenuDirectionLeft:
                        destPoint = CGPointMake( centerv.center.x - self.distance * k/2, centerv.center.y);
                        break;
                    case HLLinerPopMenuDirectionRight:
                        destPoint = CGPointMake( centerv.center.x + self.distance * k/2, centerv.center.y);
                        break;
                    default:
                        break;
                }
                [UIView animateWithDuration:self.animationTimeInterval animations:^{
                    btn.center = destPoint;
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
