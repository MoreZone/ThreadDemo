//
//  NSThreadController.m
//  xiancheng_@1
//
//  Created by More on 17/1/12.
//  Copyright © 2017年 More. All rights reserved.
//

#import "NSThreadController.h"

@interface NSThreadController ()

@end

@implementation NSThreadController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.view.backgroundColor =[UIColor whiteColor];
    
    [self createNSThread];
}

/**
 
 */
-(void)createNSThread{
    
    //创建后 立即调用线程
    
    NSThread *thread =[[NSThread alloc]initWithTarget:self selector:@selector(first) object:nil];
    thread.name =@"线程1";
    thread.threadPriority =1;//  优先级
    [thread start];  // 手动开启
    
    [NSThread detachNewThreadSelector:@selector(second) toTarget:self withObject:@"More"];
    
    // 获取当前线程
   // NSThread *threads =[NSThread currentThread];
    // [NSThread exit];
    
}
- (void)first{
    sleep(1);
    NSLog(@"1");
    
    // 线程阻塞
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];

}
- (void)second{
    sleep(2);
    NSLog(@"2");
    
    //返回主线程
    [self performSelectorOnMainThread:@selector(func) withObject:nil waitUntilDone:NO];
}
- (void)func{
    NSLog(@"主线程:子线程执行结束");
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}



@end
