//
//  classifyViewController.m
//  classify
//
//  Created by Chris Xu on 2017/8/11.
//  Copyright © 2017年 Chris Xu. All rights reserved.
//

#import "classifyViewController.h"
#import "Macros.h"
#import "tableViewItem.h"
#import "collectionViewItem.h"
#import "MJExtension.h"
#import "XTableViewCell.h"
#import "goodsCollectionViewCell.h"

@interface classifyViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UICollectionView *collectionView;
/* 左边数据 */
@property (strong , nonatomic)NSMutableArray<tableViewItem *> *titleItem;
/* 右边数据 */
@property (strong , nonatomic)NSMutableArray<collectionViewItem *> *mainItem;
@end

@implementation classifyViewController


#pragma mark -- lazyload
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.frame = CGRectMake(0, 64, 100, ScreenH - 64- 49);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        
        [self.view addSubview:_tableView];
        
        [_tableView registerClass:[XTableViewCell class] forCellReuseIdentifier:@"XTableViewCell"];
    }
    return _tableView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumInteritemSpacing = 1; //X
        layout.minimumLineSpacing = 1;  //Y
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.frame = CGRectMake(100, 180, ScreenW - 100, ScreenH - 180 - 49);
        //注册Cell
        
        [_collectionView registerClass:[goodsCollectionViewCell class] forCellWithReuseIdentifier:@"goodsCollectionViewCell"];
        
        //注册Header
        
    }
    return _collectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTab];
    [self setUpData];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setUpTab
{
    self.view.backgroundColor = DCBGColor;
    self.tableView.backgroundColor = [UIColor greenColor];
    self.collectionView.backgroundColor = [UIColor blueColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)setUpData
{
    _titleItem = [tableViewItem mj_objectArrayWithFilename:@"ClassifyTitles.plist"];
    _mainItem = [collectionViewItem mj_objectArrayWithFilename:@"ClassiftyGoods01.plist"];
    //默认选择第一行（注意一定要在加载完数据之后）
    [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
}




#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleItem.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTableViewCell" forIndexPath:indexPath];
    cell.titleItem = _titleItem[indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = _titleItem[indexPath.row].fileName;
    _mainItem = [collectionViewItem mj_objectArrayWithFilename:str];
    
    [self.collectionView reloadData];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _mainItem.count;
}

#pragma mark - <UICollectionViewDelegate>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *gridcell = nil;
    
    goodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"goodsCollectionViewCell" forIndexPath:indexPath];
    cell.goodsItem = _mainItem[indexPath.row];
    gridcell = cell;
    
    return gridcell;
}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

//}
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake((ScreenW - 100)/2-1, 120);
    
}

#pragma mark - head宽高
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    return CGSizeMake(ScreenW, 25);
//}

#pragma mark - foot宽高
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    return CGSizeZero;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
