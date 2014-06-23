//
//  IJobs.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/16/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "DisplayName.h"
#import "Resume.h"
#import "JobPostedDate.h"
#import "JobMetaData.h"
#import "JobIDName.h"

@protocol IJob <NSObject>
@property JobIDName *jobIDName;
@property JobMetaData *jobMetaData;
-(IDentifer*)generateJobID;
@end
