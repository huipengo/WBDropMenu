//
//  ViewController.m
//  WBDropMenu
//
//  Created by huipeng on 2020/8/9.
//  Copyright © 2020 huipeng. All rights reserved.
//

#import "ViewController.h"
#import "WBDropMenuView.h"

@interface ViewController () <WIMDropMenuDelegate, WIMDropMenuDataSource>

@property (nonatomic, strong) WBDropMenuView *menuView;

@property (nonatomic, strong) NSArray<WBDropMenuItem *> *menuItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    #ifdef __IPHONE_11_0
        if (@available(iOS 11.0, *)) { }
        else
    #endif
        {
            self.automaticallyAdjustsScrollViewInsets = true;
        }
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.menuView = [WBDropMenuView menuViewWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 44.0f) inSuperView:self.view];
    self.menuView.dataSource = self;
    self.menuView.delegate   = self;
    
    self.navigationItem.titleView = self.menuView;
    
    [self.menuView reloadData];
}

#pragma mark - WIMDropMenuDelegate
- (WBDropMenuItem *)menuItemForRow:(NSInteger)row {
    WBDropMenuItem *item = [self.menuItems objectAtIndex:row];
    return item;
}

- (NSInteger)menuNumberOfRows {
    return [self.menuItems count];
}

- (void)menuView:(WBDropMenuView *)menuView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSArray<WBDropMenuItem *> *)menuItems {
    if (!_menuItems) {
        
        WBDropMenuItem *item_0 = [[WBDropMenuItem alloc] init];
        item_0.imageName = @"icon";
        item_0.title = @"最近项目";
        item_0.content = @"0";
        
        WBDropMenuItem *item_1 = [[WBDropMenuItem alloc] init];
        item_1.imageName = @"icon";
        item_1.title = @"截屏";
        item_1.content = @"15";
        
        WBDropMenuItem *item_2 = [[WBDropMenuItem alloc] init];
        item_2.imageName = @"icon";
        item_2.title = @"视频";
        item_2.content = @"19";
        
        WBDropMenuItem *item_3 = [[WBDropMenuItem alloc] init];
        item_3.imageName = @"icon";
        item_3.title = @"全景照片";
        item_3.content = @"3";
        
        WBDropMenuItem *item_4 = [[WBDropMenuItem alloc] init];
        item_4.imageName = @"icon";
        item_4.title = @"自拍";
        item_4.content = @"99";
        
        WBDropMenuItem *item_5 = [[WBDropMenuItem alloc] init];
        item_5.imageName = @"icon";
        item_5.title = @"个人收藏";
        item_5.content = @"108";
                
        _menuItems = @[item_0, item_1, item_2, item_3, item_4, item_5];
    }
    return _menuItems;
}

@end
