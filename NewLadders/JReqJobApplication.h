//
//  JReqJobApplication.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/17/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "IJobApplication.h"
#import "JobApplicationCoreFields.h"

@interface JReqJobApplication : NSObject <IJobApplication>{
    
    JobApplicationCoreFields *gJobApplicationCoreFields ;
    IDentifer *gresumeID;
}

-(JReqJobApplication*)initWithCoreFields:(JobApplicationCoreFields*)jobApplicationCoreFields withOptionalResumeID:(IDentifer*)resumeID;
//-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString;
//-(CSVReportString*)appendJobApplicationReportRecordTo:(CSVReportString*)cSVReportString;
//-(HTMLReportString*)appendJobApplicationHTMLReportRecordTo:(HTMLReportString*)hTMLReportString;
-(void)callUpdateJobApplicationModel;
@end
