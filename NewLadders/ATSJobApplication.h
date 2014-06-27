//
//  ATSJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "IJobApplication.h"

@interface ATSJobApplication : NSObject <IJobApplication>{
    IDentifer *gjobSeekerID ;
    IDentifer *gjobID;
    IDentifer *gresumeID;
}
-(void)applyForJob;
-(void)updateJobApplicationModel;
-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString;
-(id<IJobApplication>)initWithJobseekerId:(IDentifer*)jobSeekerID forJObID:(IDentifer*)jobID withOptionalResumeID:(IDentifer*)resumeID;
@end
