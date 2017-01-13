//
//  ViewController.m
//  xiancheng_@1
//
//  Created by More on 17/1/12.
//  Copyright © 2017年 More. All rights reserved.
//

#import "ViewController.h"
#import "NSThreadController.h"
#import "NSOperationViewController.h"

static    NSString * Cell =@"Cell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tab;
    
}
@property(nonatomic,strong)NSArray *nameArray;

@end

@implementation ViewController



- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self makeUI];
    self.navigationItem.title =@"线程";

}
-(void)makeUI
{
    
    self.nameArray =[[NSArray alloc]initWithObjects:@"NSThread",@"NSOperation",@"GCD" ,@"断点下载",@"@author-by  More",nil];
    _tab =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tab.dataSource =self;
    _tab.delegate =self;
    _tab.rowHeight =44;
    [self.view addSubview:_tab];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell ==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    cell.textLabel.text =self.nameArray[indexPath.row];
    
    if (indexPath.row==4) {
        
        cell.textLabel.textAlignment =NSTextAlignmentRight;
        cell.textLabel.textColor =[UIColor purpleColor];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {
        
        NSThreadController*thread =[[NSThreadController alloc]init];
        [self.navigationController pushViewController:thread animated:YES];
    }else if (indexPath.row ==1){
        NSOperationViewController *vc =[[NSOperationViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
