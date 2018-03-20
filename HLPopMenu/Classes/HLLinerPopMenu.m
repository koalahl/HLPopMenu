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
    self.centerBtn.selected = !self.centerBtn.isSelected;
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
                CGPoint destPoint = CGPointZero;
                switch (self.direction) {
                    case HLLinerPopMenuDirectionUp:
                        destPoint = CGPointMake( self.centerBtn.center.x, self.centerBtn.center.y - self.distance * k/2);
                        break;
                    case HLLinerPopMenuDirectionDown:
                        destPoint = CGPointMake( self.centerBtn.center.x, self.centerBtn.center.y + self.distance * k/2);
                        break;
                    case HLLinerPopMenuDirectionLeft:
                        destPoint = CGPointMake( self.centerBtn.center.x - self.distance * k/2, self.centerBtn.center.y);
                        break;
                    case HLLinerPopMenuDirectionRight:
                        destPoint = CGPointMake( self.centerBtn.center.x + self.distance * k/2, self.centerBtn.center.y);
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
