//
//  HLPopMenu.m
//  HLCirclyMenu
//
//  Created by HanLiu on 2018/3/19.
//

#import "HLPopMenu.h"
#import "HLLinerPopMenu.h"
#import "HLCirclePopMenu.h"

@interface HLPopMenu()
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,strong) NSMutableArray  *menuItemsArray;
@end
@implementation HLPopMenu

+ (HLPopMenu *)menuWithType:(HLPopMenuStyle)type {
    HLPopMenu *menu = nil;
    if (type == HLPopMenuStyleLiner) {
        menu = (HLPopMenu *)[[HLLinerPopMenu alloc] init];
    }else {
        menu = (HLPopMenu *)[[HLCirclePopMenu alloc] init];
    }
    return menu;
}


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

    self.animationTimeInterval = 0.25;
}

- (void)layoutSubviews {
    for (UIButton *btn in self.menuItemsArray) {
        btn.center = self.centerBtn ? self.centerBtn.center : self.centerView.center;
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

- (void)setCenterView:(UIView *)centerView {
    _centerView = centerView;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(open)];
    [_centerView addGestureRecognizer:tap];
    _centerView.userInteractionEnabled = YES;
    [self addSubview:_centerView];
}
- (void)setItems:(NSArray *)items {
    _menuItemsArray = [NSMutableArray arrayWithArray:items];
    [self setMenuItems];
}

- (NSArray *)items {
    return self.menuItemsArray;
}
- (void)clickedBtn:(UIButton *)sender {
    NSInteger index = sender.tag - 10001;
    if ([self.delegate respondsToSelector:@selector(didSelectItem:inMenu:atIndex:)]) {
        [self.delegate didSelectItem:sender inMenu:self atIndex:index];
    }
}

#pragma mark - 截获屏幕点击事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    BOOL result = CGRectContainsPoint(self.centerBtn?self.centerBtn.frame:self.centerView.frame, point);
    
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
- (void)open {};
- (void)close{};

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
