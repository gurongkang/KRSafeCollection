//
//  ViewController.m
//  KRSafeCollection
//
//  Created by RK on 2017/12/8.
//  Copyright © 2017年 RK. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+KRSafe.h"
#import "NSMutableDictionary+KRSafe.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark life

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testArray];
}

- (void)testArray {
    NSArray *array = @[@"1", @"2"];
    NSLog(@"%@", [array kr_safeObjectAtIndex:3]);
}



@end
