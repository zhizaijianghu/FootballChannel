//
//  LiveHandle.h
//  FootballChannel
//
//  Created by lanou3g on 16/5/18.
//  Copyright © 2016年 张志江. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllLiveModel.h"
#import "DateLiveModel.h"
@interface LiveHandle : NSObject

@property (nonatomic, strong) AllLiveModel *allLiveModel;
@property (nonatomic, strong) DateLiveModel *dateLiveModel;
@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) NSMutableArray *models;

+ (LiveHandle *)shareHandle;

- (void)getAllLivesWithUrl:(NSString *)url completion:(void(^)(AllLiveModel *allLivesModel, DateLiveModel *dateModel, NSError *error))completion;

@end
