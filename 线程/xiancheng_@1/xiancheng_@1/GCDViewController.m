//
//  GCDViewController.m
//  xiancheng_@1
//
//  Created by More on 17/1/12.
//  Copyright © 2017年 More. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
/**
 同步函数+主队列
 */
-(void)syncMain
{
    dispatch_queue_t queue =dispatch_get_main_queue();
    //任务加入队列
    dispatch_sync(queue, ^{
        NSLog(@"1-----%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"2-----%@", [NSThread currentThread]);
    });
}
/**
 异步函数+主队列  只有主线程中执行任务
 */
-(void)asyncMain
{
    dispatch_queue_t queue =dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"1-----%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2-----%@", [NSThread currentThread]);
    });
}

/**
 同步函数+串行队列 不会开启新的线程 在当前线程执行任务 任务是串行的执行完成一个任务 在执行下一个任务
 */
-(void)sysSerial
{
    dispatch_queue_t queue =dispatch_queue_create("1", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        NSLog(@"1-----%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"2-----%@", [NSThread currentThread]);
    });
}
/**
 异步函数 +串行队列  会开启新的线程 但是任务是串行的执行完成一个任务在在执行下一个任务
 */
-(void)asyncSerial
{
    dispatch_queue_t queue =dispatch_queue_create("2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        NSLog(@"1-----%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2-----%@", [NSThread currentThread]);
    });
}

//同步函数+并发队列
-(void)syscConcurrent
{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, ^{
        NSLog(@"1-----%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"2-----%@", [NSThread currentThread]);
    });
}

/**
 异步函数 +并发队列 同时开启多条线程
 */
-(void)asyncConcurrent
{
    
    dispatch_queue_t queue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"1-----%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"2-----%@", [NSThread currentThread]);
        }
    });
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
