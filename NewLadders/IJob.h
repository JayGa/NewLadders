//
//  IJobs.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/16/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "Resume.h"
#import "JobPostedDate.h"
#import "JobMetaData.h"
#import "JobIDName.h"
#import "JobApplicationCoreFields.h"

@protocol IJob <NSObject>
-(NSString*)appendJobDisplayName;
-(void)callToAppendJobToJobApplicationReport:(JobApplicationCoreFields*)jobApplicationCoreFields;
-(void)appendToReportString:(NSString*)reportSubString;
@end
