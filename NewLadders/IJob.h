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

@protocol IJob <NSObject>

@property IDentifer *jobID;
@property NSString *jobName;
@property JobMetaData *jobMetaData;
-(void)applyForJobWithResume:(Resume *)resume;
-(IDentifer*)generateJobID;
@end
