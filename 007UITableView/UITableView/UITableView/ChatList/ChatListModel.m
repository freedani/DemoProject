//
//  ChatListModel.m
//  UITableView
//
//  Created by 李达 on 2017/4/13.
//  Copyright © 2017年 李达. All rights reserved.
//

#import "ChatListModel.h"

@implementation ChatListDetailModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.imageName = dictionary[@"imageName"];
        self.name = dictionary[@"name"];
        self.lastChatDate = dictionary[@"lastChatDate"];
        self.detailString = dictionary[@"detailString"];
    }
    return self;
}

@end

@implementation ChatListModel

- (instancetype)init {
    if (self = [super init]) {
        self.chatListArray = [[NSMutableArray alloc] init];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ChatListModel" ofType:@"plist"];
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
            ChatListDetailModel *chatListDetailModel = [[ChatListDetailModel alloc] initWithDictionary:obj];
            [self.chatListArray addObject:chatListDetailModel];
        }];
    }
    return self;
}

@end
