//
//  AllLiveModel.h
//  FootballChannel
//
//  Created by lanou3g on 16/5/18.
//  Copyright © 2016年 张志江. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllLiveModel : NSObject{
    NSString *_id;
}
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *sdate;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *start;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *pinglun;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSString *visit_logo;
@property (nonatomic, strong) NSString *bean_order;
@property (nonatomic, strong) NSString *visit_team;
@property (nonatomic, strong) NSString *home_team;
@property (nonatomic, strong) NSString *home_logo;
@property (nonatomic, strong) NSMutableDictionary *league;
@end
