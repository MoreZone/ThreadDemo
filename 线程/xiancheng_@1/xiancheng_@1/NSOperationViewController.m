//
//  NSOperationViewController.m
//  xiancheng_@1
//
//  Created by More on 17/1/12.
//  Copyright © 2017年 More. All rights reserved.
//

#import "NSOperationViewController.h"

@interface NSOperationViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;


@end

@implementation NSOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self opetationQueue];
}

/**
 
 */
-(void)opetationQueue{
    
    NSOperationQueue *queue =[[NSOperationQueue alloc]init];
    
    // 可以设置最大的操作数  并行操作
    queue.maxConcurrentOperationCount =2;
    
    [queue addOperationWithBlock:^{
        NSLog(@"download1 --- %@", [NSThread currentThread]);
        
        [NSThread sleepForTimeInterval:0.01];
    }];
    
    [queue addOperationWithBlock:^{
        NSLog(@"download2 --- %@", [NSThread currentThread]);
        
        [NSThread sleepForTimeInterval:0.01];
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"download3 --- %@", [NSThread currentThread]);
        
        [NSThread sleepForTimeInterval:0.01];
    }];
    
    self.queue =queue;
    
    /**
     第二种方式创建
     */
//    NSInvocationOperation *op1 =[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(download1) object:nil];
//    
//    NSInvocationOperation *op2 =[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(download2) object:nil];
//    [queue addOperation:op1];
//    [queue addOperation:op2];
    
    /**
     第三种方式创建
     */
    NSBlockOperation *operation4 =[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download4 --- %@", [NSThread currentThread]);

    }];
    
    NSBlockOperation *operation5 =[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download5 --- %@", [NSThread currentThread]);
    }];
    [queue addOperation:operation4];
    [queue addOperation:operation5];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self blockOperation];
}

-(void)blockOperation
{
    
    NSBlockOperation *op =[NSBlockOperation blockOperationWithBlock:^{
       //主线程
        NSLog(@"下载1------%@", [NSThread currentThread]);
        
    }];
    [op addExecutionBlock:^{
        NSLog(@"下载2------%@", [NSThread currentThread]);
 
    }];
    
    [op addExecutionBlock:^{
        NSLog(@"下载3------%@", [NSThread currentThread]);
    }];
    
    [op start];
    
}

- (void)invocationOperation
{
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    [op start];
}

- (void)run
{
    NSLog(@"------%@", [NSThread currentThread]);
}


- (void)download1
{
    NSLog(@"download1 --- %@", [NSThread currentThread]);
}

- (void)download2
{
    NSLog(@"download2 --- %@", [NSThread currentThread]);
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
