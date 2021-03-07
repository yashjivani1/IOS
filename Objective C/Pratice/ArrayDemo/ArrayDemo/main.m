//
//  main.m
//  ArrayDemo
//
//  Created by haco on 02/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray * array = [[NSArray alloc]initWithObjects:@"Hi",@"Hello",@"Hey", nil];
        
        NSLog(@"%@", array);
        
        NSMutableArray * arrayData = [[NSMutableArray alloc]initWithObjects:@"Hi",@"Hello",@"Haco", nil];
        [arrayData addObject:@"Counter"];
    
        [arrayData insertObject:@"the" atIndex:0];
        NSLog(@"%@", arrayData);
        [arrayData removeObject:@"the"];
        [arrayData removeObjectAtIndex:1];
        [arrayData removeLastObject];
        NSLog(@"%@", arrayData);
        [arrayData removeAllObjects];
        NSLog(@"%@", arrayData);
        
    }
    return 0;
}
