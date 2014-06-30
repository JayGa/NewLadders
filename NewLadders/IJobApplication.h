//
//  IJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"

@protocol IJobApplication <NSObject>
//{
//    
//    IDentifer *jobSeekerID ;
//    IDentifer *jobID;
//}
-(id<IJobApplication>)initWithJobseekerId:(IDentifer*)jobSeekerID forJObID:(IDentifer*)jobID withOptionalResumeID:(IDentifer*)resumeID;
-(void)applyForJob;
-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString;
-(void)callUpdateJobApplicationModel;
@end
