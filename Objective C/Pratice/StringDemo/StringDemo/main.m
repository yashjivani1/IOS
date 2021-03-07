//
//  main.m
//  StringDemo
//
//  Created by haco on 02/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString * str = @"It is a string";
        NSLog(@"%@", str);
        str = @"It Changed";
        NSLog(@"%@", str);
        
        NSMutableString * str1 = [[NSMutableString alloc]initWithString:@"It is mutable string"];
        [str1 appendString:@" Haco"];
        [str1 insertString:@" immutable" atIndex: [str1 length] - 1];
        [str1 replaceCharactersInRange:NSMakeRange(9, 8) withString:@"mutable"];
        [str1 deleteCharactersInRange:NSMakeRange(9,7)];
        
        NSLog(@"%@", str1);
    }
    return 0;
}
