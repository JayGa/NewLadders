//
//  JobDisplayName.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/9/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDisplayName.h"
#import "JobIDName.h"
#import "EmployerModel.h"
#import "JAModel.h"
#import "IReportGenerator.h"
@class UserDisplayName;
@class JobIDName;
@interface JobDisplayName : NSObject{
    
    NSString *gdisplayName;
}

-(JobDisplayName*)initWithJob:(NSString *)jobName andPoster:(UserDisplayName *)postersName;
-(NSString*)appendJobDisplayNameString:(NSString*)reportString;
-(void)callToAppendJobToApplicationReportElements:(id<IReportGenerator>)iReportGenerator;
-(void)callToAppendJobToAggregrateJobApplicationReport;
-(void)callToAppendJobToEmployerAggregrateJobApplicationReport;
@end
