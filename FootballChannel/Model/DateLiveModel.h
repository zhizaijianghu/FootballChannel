//
//  DateLiveModel.h
//  FootballChannel
//
//  Created by lanou3g on 16/5/18.
//  Copyright © 2016年 张志江. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllLiveModel.h"
@interface DateLiveModel : NSObject

@property (nonatomic, strong) NSString *formatDate;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSMutableArray *list;
@end
