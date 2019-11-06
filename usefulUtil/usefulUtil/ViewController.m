//
//  ViewController.m
//  usefulUtil
//
//  Created by apple on 2019/11/6.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ViewController.h"
#import "JSCellModel.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, retain)NSMutableArray *dataArray;
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"userfulUtil";
    [self initTableView];
    [self initData];
}

- (void)initData {
    self.dataArray = [NSMutableArray array];
    JSCellModel *model = [[JSCellModel alloc] init];
    model.title = @"event的block封装";
    model.vcName = @"ControlEventViewController";
    
    [self.dataArray addObject:model];
    
    [self.tableView reloadData];
}

- (void)initTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - tableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const cellId = @"defaultCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    
    JSCellModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.title;
    
   cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JSCellModel *model = self.dataArray[indexPath.row];
    Class classVc =  NSClassFromString(model.vcName);
    UIViewController *vc = [[classVc alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end

