//
//  DuanZiModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NewsInfoModel,NewsListModel;
@interface BaiSiNewsModel : BaseModel

@property (nonatomic, strong) NewsInfoModel *info;

@property (nonatomic, strong) NSArray<NewsListModel *> *list;

@end

@interface NewsInfoModel : BaseModel

@property (nonatomic, copy) NSString *maxid;

@property (nonatomic, copy) NSString *vendor;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *maxtime;

@property (nonatomic, assign) NSInteger page;

@end

@interface NewsListModel : BaseModel

@property (nonatomic, assign) NSInteger cacheVersion;

@property (nonatomic, copy) NSString *createdAt;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *voicetime;

@property (nonatomic, copy) NSString *voicelength;

@property (nonatomic, strong) NSArray *topCmt;

@property (nonatomic, copy) NSString *repost;

@property (nonatomic, copy) NSString *bimageuri;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *themeType;

@property (nonatomic, copy) NSString *hate;

@property (nonatomic, copy) NSString *ding;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *passtime;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *themeName;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *favourite;

@property (nonatomic, strong) NSArray *themes;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *height;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *videotime;

@property (nonatomic, copy) NSString *bookmark;

@property (nonatomic, copy) NSString *cai;

@property (nonatomic, copy) NSString *screenName;

@property (nonatomic, copy) NSString *profileImage;

@property (nonatomic, copy) NSString *love;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *themeId;

@property (nonatomic, copy) NSString *originalPid;

@property (nonatomic, assign) NSInteger t;

@property (nonatomic, copy) NSString *weixinUrl;

@property (nonatomic, copy) NSString *voiceuri;

@property (nonatomic, copy) NSString *videouri;

@property (nonatomic, copy) NSString *width;

@property(nonatomic ,copy )NSString *gifFistFrame;

@property(nonatomic ,copy )NSString *cdnImg;

@property (nonatomic, copy) NSString *voiceLength;

@property (nonatomic, copy) NSString *image1;


/** 是否为动态图 */
@property (nonatomic,assign)BOOL is_gif;
/** 是否为大图 */
@property (nonatomic,assign,getter=isBigPicture)BOOL bigPicture;
@property (nonatomic,assign,getter=isBigPicture)BOOL isGif;



@end

