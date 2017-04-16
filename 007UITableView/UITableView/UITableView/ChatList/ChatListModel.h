//
//  ChatListModel.h
//  UITableView
//
//  Created by 李达 on 2017/4/13.
//  Copyright © 2017年 李达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatListDetailModel : NSObject

@property(nonatomic, copy) NSString *imageName;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *detailString;
@property(nonatomic, copy) NSDate *lastChatDate;

@end;

@interface ChatListModel : NSObject

@property(nonatomic, strong) NSMutableArray<ChatListDetailModel *> *chatListArray;
@end
