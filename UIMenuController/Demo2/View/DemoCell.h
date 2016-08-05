//
//  DemoCell.h
//  UIMenuController
//
//  Created by YHIOS002 on 16/8/5.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoModel.h"
@interface DemoCell : UITableViewCell

@property (nonatomic,strong) DemoModel *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
