//
//  main.m
//  005block
//
//  Created by 李达 on 2017/3/24.
//  Copyright © 2017年 李达. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int (^blk_t)(int);
typedef void (^blk_void)(void);

int main(int argc, const char * argv[]) {
    for (int rate = 0; rate < 10; rate++) {
        blk_t blk1 = ^(int count){return rate * count;};
        NSLog(@"blk1:%@",blk1);
        blk_t blk2 = ^(int count){return count++;};
        NSLog(@"blk2:%@",blk2);
        NSLog(@"blk2 class:%@",[blk2 class]);
    }
    return 0;
}
