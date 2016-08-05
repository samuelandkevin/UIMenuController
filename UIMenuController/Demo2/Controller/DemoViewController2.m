//
//  DemoViewController2.m
//  UIMenuController
//
//  Created by YHIOS002 on 16/8/5.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

#import "DemoViewController2.h"
#import "HKPLabel.h"
#import "DemoCell.h"
#import "DemoModel.h"

@interface DemoViewController2 ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation DemoViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HKPLabel *label = [[HKPLabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"当前label为第一响应者";
    [self.view addSubview:label];
    
    for (int i = 0; i < 8; i++)
    {
        DemoModel *model = [[DemoModel alloc] init];
        model.content    = [NSString stringWithFormat:@"这是第%d个Demo,呵呵呵呵呵呵呵呵呵呵呵呵呵。",i];
        [self.dataArray addObject:model];
    }
    
    CGFloat tbvY = CGRectGetMaxY(label.frame) +10;
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, tbvY, self.view.frame.size.width, self.view.frame.size.height - 180)];
    tableview.delegate   = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.rowHeight  = 69.0f;
    self.tableView = tableview;
    [self.view addSubview:tableview];
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DemoCell *cell = [DemoCell cellWithTableView:tableView];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
