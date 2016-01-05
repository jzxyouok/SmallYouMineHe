//
//  JieFuModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class JieFuDataModel,JieFuItemviewModel,JieFuUserviewModel;
@interface JieFuModel : BaseModel

@property (nonatomic, copy) NSString *code;

@property (nonatomic, strong) NSArray<JieFuDataModel *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) BOOL result;

@end
@interface JieFuDataModel : NSObject

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger likeNum;

@property (nonatomic, assign) NSInteger upWeight;

@property (nonatomic, copy) NSString *mainPicPath;

@property (nonatomic, assign) NSInteger shareWeight;

@property (nonatomic, assign) NSInteger downWeight;

@property (nonatomic, assign) long long ts;

@property (nonatomic, assign) NSInteger clickNum;

@property (nonatomic, assign) NSInteger bisDelete;

@property (nonatomic, assign) NSInteger downNum;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger bisDown;

@property (nonatomic, assign) long long publicTime;

@property (nonatomic, assign) NSInteger commentNum;

@property (nonatomic, assign) NSInteger bisPublic;

@property (nonatomic, assign) NSInteger shareNum;

@property (nonatomic, assign) NSInteger bisRecommend;

@property (nonatomic, assign) NSInteger commentWeight;

@property (nonatomic, assign) NSInteger bisUp;

@property (nonatomic, assign) NSInteger itemCount;

@property (nonatomic, assign) NSInteger pushMsgNum;

@property (nonatomic, assign) long long createTime;

@property (nonatomic, strong) JieFuItemviewModel *itemView;

@property (nonatomic, strong) JieFuUserviewModel *userView;

@property (nonatomic, assign) NSInteger clickWeight;

@property (nonatomic, assign) NSInteger upNum;

@property (nonatomic, strong) NSArray *commentHotList;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger bisLike;

@property (nonatomic, assign) NSInteger likeWeight;

@property (nonatomic, assign) NSInteger mediaType;

@property (nonatomic, assign) NSInteger typeId;

@end

@interface JieFuItemviewModel : NSObject

@property (nonatomic, assign) NSInteger articleId;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger bisDelete;

@property (nonatomic, assign) NSInteger mediaType;

@property (nonatomic, copy) NSString *gifPath;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) long long createTime;

@property (nonatomic, assign) NSInteger height;

@property (nonatomic, copy) NSString *picPath;

@property (nonatomic, copy) NSString *playTime;

@property (nonatomic, assign) NSInteger gifSize;

@property (nonatomic, assign) long long ts;

@property (nonatomic, copy) NSString *content;

@end

@interface JieFuUserviewModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger bisDelete;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, assign) NSInteger sex;

@property (nonatomic, assign) NSInteger comId;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) long long createTime;

@property (nonatomic, assign) long long birthday;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, assign) NSInteger thirdType;

@property (nonatomic, copy) NSString *token;

@property (nonatomic, assign) long long ts;

@property (nonatomic, copy) NSString *headImg;

@end

