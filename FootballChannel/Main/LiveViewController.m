//
//  LiveViewController.m
//  FootballChannel
//
//  Created by lanou3g on 16/5/18.
//  Copyright © 2016年 张志江. All rights reserved.
//

#import "LiveViewController.h"
#import "AllLiveTableViewCell.h"
#import "DidEndTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LiveViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *allLiveTableView;
@property (nonatomic, strong) UITableView *didEndTableView;
@property (nonatomic, strong) NSMutableArray *aDataArray;
@property (nonatomic, strong) NSMutableArray *dDataArray;
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.aDataArray = [NSMutableArray array];
    self.dDataArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        [self.aDataArray addObject:@"直播"];
        [self.dDataArray addObject:@"视频"];
    }
    
    
    [self loadScrollView];
    [self loadAllLiveTableView];
    [self loadSegmentControl];


    

}

//加载SegmentControl
- (void)loadSegmentControl
{
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"全部直播",@"已结束"]];
    self.navigationItem.titleView = self.segmentControl;
    
    self.segmentControl.tintColor = [UIColor whiteColor];
    [self.segmentControl addTarget:self action:@selector(segmentAction:) forControlEvents:(UIControlEventValueChanged)];
    self.segmentControl.selectedSegmentIndex = 0;
}

//执行segment事件
- (void)segmentAction:(UISegmentedControl *)segmented
{
    switch (segmented.selectedSegmentIndex) {
        case 0:
            self.scrollView.contentOffset = CGPointMake(0, 0);
            if (self.allLiveTableView == nil) {
                [self loadAllLiveTableView];
            }
            break;
        case 1:
            self.scrollView.contentOffset = CGPointMake(WIDTH, 0);
            if (self.didEndTableView == nil) {
                [self loadDidEndTableView];
            }
            break;
        default:
            break;
    }
}

//加载scrollView
- (void)loadScrollView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(WIDTH * 2, WIDTH);
    
    [self.view addSubview:self.scrollView];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
}

//加载AllLiveTableView
- (void)loadAllLiveTableView
{
    self.allLiveTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:(UITableViewStyleGrouped)];
    self.allLiveTableView.delegate = self;
    self.allLiveTableView.dataSource = self;
    [self.scrollView addSubview:self.allLiveTableView];
    self.allLiveTableView.backgroundColor = [UIColor cyanColor];
    
    
    [self.allLiveTableView registerNib:[UINib nibWithNibName:@"AllLiveTableViewCell" bundle:nil] forCellReuseIdentifier:@"aCell"];
    
}

//加载DidEndTableView
- (void)loadDidEndTableView
{
    self.didEndTableView = [[UITableView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT) style:(UITableViewStyleGrouped)];
    self.didEndTableView.delegate = self;
    self.didEndTableView.dataSource = self;
    [self.scrollView addSubview:self.didEndTableView];
    self.didEndTableView.backgroundColor = [UIColor redColor];
    
    
    [self.didEndTableView registerNib:[UINib nibWithNibName:@"DidEndTableViewCell" bundle:nil] forCellReuseIdentifier:@"dCell"];
    
}

//scrollView滑动完执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView) {
        NSInteger page = self.scrollView.contentOffset.x / WIDTH;
        if (page == 0) {
            if (self.allLiveTableView == nil) {
                [self loadAllLiveTableView];
            }
            self.segmentControl.selectedSegmentIndex = 0;
        }else{
            if (self.didEndTableView == nil) {
                [self loadDidEndTableView];
            }
            self.segmentControl.selectedSegmentIndex = 1;
        }
    }

}


#pragma mark --- tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView == self.allLiveTableView) {
        return self.aDataArray.count;
    }else{
        return self.dDataArray.count;
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if ([tableView isEqual:self.allLiveTableView]) {
         AllLiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aCell"];
        
        return cell;
    }else{
        DidEndTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dCell"];
       
        return cell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
