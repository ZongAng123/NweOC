//
//  ViewController.m
//  NewOC
//
//  Created by 纵昂 on 2021/5/4.
//

#import "ViewController.h"
#import "ZAFileTableViewCell.h"
#import "HomeApi.h"
#import "NewModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *dataArray; //数据
    UITableView *mainTableView; //cell
}
@property NSInteger page; //分页
@property BOOL reloadormore;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"纵昂新闻";
    self.view.backgroundColor =[UIColor whiteColor];
    
    
    dataArray = [[NSMutableArray alloc]initWithCapacity:1];
    _page=1;
    _reloadormore = YES;
    
    [self requestData];
    
    mainTableView=[[UITableView alloc] init];
    [self.view addSubview:mainTableView];
    [mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT));
    }];
    mainTableView.tag=1;
    mainTableView.delegate =self;
    mainTableView.dataSource =self;
    mainTableView.separatorStyle = YES;
    mainTableView.backgroundColor=[UIColor clearColor];
    mainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    mainTableView.estimatedRowHeight = 0;
    mainTableView.estimatedSectionHeaderHeight = 0;
    mainTableView.estimatedSectionFooterHeight = 0;
    [mainTableView setSeparatorColor : [UIColor grayColor]];//分割线颜色
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine; //分割线
    
    __weak typeof(self)blockweakself=self;
    mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        blockweakself.page=1;
        blockweakself.reloadormore=YES;
        [blockweakself requestData];
    }];
    mainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [blockweakself requestData];
    }];
}

- (void)viewDidLayoutSubviews {
    if ([mainTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [mainTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([mainTableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [mainTableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

/*
 http://c.m.163.com/nc/article/headline/T1348649580692/0-40.html
 **/

- (void)requestData{

    HomeApi *api = [[HomeApi alloc]type:@"1" page:@"1" psize:@"20"];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"----------%@",request);
        [self->mainTableView.mj_header endRefreshing];
//      json转模型
        NSData *jsonData = [request.responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"++++++++++++++++++%@",dic);
//        NSDictionary *dict = dic[@"data"];
        if ([dic[@"code"]integerValue] == 1) {
            NSArray *myArray = [ZABaseObject returnArr:[dic objectForKey:@"data"]];
            
            NSInteger forinteger=[myArray count];
            if (forinteger>0) {
                self->_page++;
//                if (_reloadormore) {
                [self->dataArray removeAllObjects];
//                }
                for (int i=0; i<forinteger; i++) {
                    NSDictionary *dic = [myArray objectAtIndex:i];
                    NewModel *object = [[NewModel alloc]init];
                    [object setData:dic];
                    [self->dataArray addObject:object];
                }
            }else if(forinteger==0){
                if (self->_page>1) {

                }else{
                    [self->dataArray removeAllObjects];
                }
            }
            
            [self->mainTableView reloadData];

        
        }else{
            
//            [MBProgressHUD showError:dic[@"msg"]];
        }
        [self->mainTableView.mj_header endRefreshing];
        [self->mainTableView.mj_footer endRefreshing];
        self->_reloadormore=NO;
        
    } failure:^(YTKBaseRequest *request) {
        // you can use self here, retain cycle won't happen
        NSLog(@"failed,%@",request);

        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=[indexPath row];
    static NSString *cellIdentifier = @"ZAFileTableViewCell";
    ZAFileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ZAFileTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;


    [cell setObject:[dataArray objectAtIndex:row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
//    NSInteger row=[indexPath row];
//    WHJModel *object = [dataArray objectAtIndex:row];
//
//    ZongWJPViewController *detaillAddVC = [[ZongWJPViewController alloc]init];
//    detaillAddVC.listidstr = object.whjId;
//    detaillAddVC.relationshipFlagstr = object.relationshipFlag;
//    [self.navigationController pushViewController:detaillAddVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    view.backgroundColor=[UIColor clearColor];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
