//
//  WBDropMenuView.h
//  WBDropDownMenu
//
//  Created by huipeng on 2020/8/6.
//  Copyright © 2020 huipeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBDropMenuItem.h"

NS_ASSUME_NONNULL_BEGIN

@class WBDropMenuView;
@protocol WIMDropMenuDelegate <NSObject>

@required
- (void)menuView:(WBDropMenuView *)menuView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

#pragma mark - 数据源
@protocol WIMDropMenuDataSource <NSObject>

@required
- (WBDropMenuItem *)menuItemForRow:(NSInteger)row;

- (NSInteger)menuNumberOfRows;

@end

@interface WBDropMenuView : UIView

// default 55.0f
@property (nonatomic, assign) CGFloat menuCellHeight;

@property (nonatomic, weak) id<WIMDropMenuDelegate> delegate;

@property (nonatomic, weak) id<WIMDropMenuDataSource> dataSource;

+ (instancetype)menuViewWithFrame:(CGRect)frame inSuperView:(UIView *)superView;

- (instancetype _Nullable)init NS_UNAVAILABLE;
+ (instancetype _Nullable)new NS_UNAVAILABLE;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
