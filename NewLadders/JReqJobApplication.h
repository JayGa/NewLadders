//
//  JReqJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "IJobApplication.h"
#import "CSVReportString.h"
#import "HTMLReportString.h"

@interface JReqJobApplication : NSObject <IJobApplication>{
    
    IDentifer *gjobSeekerID ;
    IDentifer *gjobID;
    IDentifer *gresumeID;
}
-(void)applyForJob;
-(void)updateJobApplicationModel;
-(id<IJobApplication>)initWithJobseekerId:(IDentifer*)jobSeekerID forJObID:(IDentifer*)jobID withOptionalResumeID:(IDentifer*)resumeID;
//-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString;
-(CSVReportString*)appendJobApplicationReportRecordTo:(CSVReportString*)cSVReportString;
-(HTMLReportString*)appendJobApplicationHTMLReportRecordTo:(HTMLReportString*)hTMLReportString;
@end
