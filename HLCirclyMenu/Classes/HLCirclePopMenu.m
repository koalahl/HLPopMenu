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

#pragma mark - View lifeCycle
- (instancetype)init {
    if (self = [super init]) {
        [self config];
    }
    return self;
}

- (instancetype)initWithCenterItem:(UIButton *)item menuItems:(NSArray <UIButton *>*)items {
    self = [super init];
    if (self) {
        //默认值
        [self config];
        self.centerBtn = item;
        self.menuItemsArray = [NSMutableArray arrayWithArray:items];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame centerItem:(UIButton *)item menuItems:(NSArray <UIButton *>*)items {
    self = [super initWithFrame:frame];
    if (self) {
        //默认值
        [self config];
        self.centerBtn = item;
        self.menuItemsArray = [NSMutableArray arrayWithArray:items];
    }
    return self;
}

- (void)config{
    self.startAngle = 0;
    self.angleScope = M_PI/2;
    self.animationTimeInterval = 0.25;
}

- (void)layoutSubviews {
    for (UIButton *btn in self.menuItemsArray) {
        btn.center = self.centerBtn.center;
    }
    NSLog(@"layoutSubviews");
}
#pragma mark - Setter
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.distance = frame.size.width + 20;
}

- (void)setCenterBtn:(UIButton *)centerBtn {
    _centerBtn = centerBtn;
    [_centerBtn addTarget:self action:@selector(open) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_centerBtn];
}

- (void)setMenuItemsArray:(NSArray *)menuItemsArray {
    _menuItemsArray = [NSMutableArray arrayWithArray:menuItemsArray];
    [self setMenuItems];
}

#pragma mark - 点击事件
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

#pragma mark - 截获屏幕点击事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    BOOL result = CGRectContainsPoint(self.centerBtn.frame, point);
    
    if (result) {
        return YES;
    }else {
        if (self.isExpanded) {
            BOOL isClickedMenuBtn = false;

            for (UIButton *btn in self.menuItemsArray) {
                BOOL xxx = CGRectContainsPoint(btn.frame, point);
                isClickedMenuBtn = isClickedMenuBtn || xxx;
            }
            return isClickedMenuBtn;

        }
    }

    return NO;
}

#pragma mark - 公开方法
- (void)addMenuItem:(UIButton *)item {
    [self.menuItemsArray addObject:item];
}

- (void)addMenuItems:(NSArray <UIButton *>*)items {
    [self.menuItemsArray addObjectsFromArray:items];
    
    //重新设置菜单按钮的tag和事件
    [self setMenuItems];
}

- (void)removeMenuItemAtIndex:(NSInteger)index {
    for (UIButton *btn in self.menuItemsArray) {
        if (btn.tag == index + 10001) {
            [btn removeFromSuperview];
        }
    }
    [self.menuItemsArray removeObjectAtIndex:index];
    
}
- (void)removeAllMenuItems {

    for (UIButton *btn in self.menuItemsArray) {
        [btn removeFromSuperview];
    }
    [self.menuItemsArray removeAllObjects];
    
}

- (void)replaceMenuWithItems:(NSArray <UIButton *>*)items {
    [self removeAllMenuItems];
    [self addMenuItems:items];
}

- (UIButton *)itemAtIndex:(NSUInteger)index {
    return self.menuItemsArray[index];
}

#pragma mark - 私有方法
- (void)setMenuItems{
    self.count = self.menuItemsArray.count;
    NSInteger i = 1;
    for (UIButton *btn in self.menuItemsArray) {
        btn.tag = 10000 + i;
        [btn addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self sendSubviewToBack:btn];
        i++;
    }
}

- (void)setEnableCenterBtn:(BOOL)enableCenterBtn {
    self.centerBtn.enabled = _enableCenterBtn = enableCenterBtn;
}
@end
