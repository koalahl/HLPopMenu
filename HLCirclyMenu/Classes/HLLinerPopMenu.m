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
        if (self.menuItemsArray.count > 1) {
            for (UIButton *btn in self.menuItemsArray) {
                k = btn.tag - 10000;
                
                [UIView animateWithDuration:self.animationTimeInterval animations:^{
                    
                    btn.center = CGPointMake( self.centerBtn.center.x, self.centerBtn.center.y - self.distance * k/2);
                    
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
    for (UIButton *btn in self.menuItemsArray) {
        k = btn.tag - 10000;
        
        [UIView animateWithDuration:self.animationTimeInterval animations:^{
            
            btn.center = self.centerBtn.center;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    self.expanded = !self.isExpanded;
}

- (void)clickedBtn:(UIButton *)sender {
    NSInteger index = sender.tag - 10001;
    if ([self.delegate respondsToSelector:@selector(didSelectItem:atIndex:)]) {
        [self.delegate didSelectItem:sender atIndex:index];
    }
}

@end
