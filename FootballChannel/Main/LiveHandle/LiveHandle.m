//
//  LiveHandle.m
//  FootballChannel
//
//  Created by lanou3g on 16/5/18.
//  Copyright © 2016年 张志江. All rights reserved.
//

#import "LiveHandle.h"

static LiveHandle *liveHandle;
@implementation LiveHandle

+ (LiveHandle *)shareHandle
{
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        if (liveHandle == nil) {
            liveHandle = [LiveHandle new];
        }
    
    });
    return liveHandle;
}

- (void)getAllLivesWithUrl:(NSString *)url completion:(void(^)(AllLiveModel *allLivesModel, DateLiveModel *dateModel, NSError *error))completion
{
    NSURL *Url = [NSURL URLWithString:url];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithURL:Url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSMutableArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            for (DateLiveModel *dateLive in arr) {
                [self.datas addObject:dateLive];

            }
            
            
        }
    }];
    [task resume];

}



@end
