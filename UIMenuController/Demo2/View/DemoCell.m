//
//  DemoCell.m
//  UIMenuController
//
//  Created by YHIOS002 on 16/8/5.
//  Copyright © 2016年 YHSoft. All rights reserved.
//

#import "DemoCell.h"
#import "HKPLabel.h"

@interface DemoCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end

@implementation DemoCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"DemoCell";
    DemoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"DemoCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:cellId];
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
    }
    return cell;
}

- (void)setModel:(DemoModel *)model{
    _model = model;
    self.labelContent.text = _model.content;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
