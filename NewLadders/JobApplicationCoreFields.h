//
//  JobApplicationCoreFields.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "IReportStringGenerator.h"



#include "IJobApplication.h"

//@protocol  IJobApplication
//@end
@interface JobApplicationCoreFields : NSObject{
        IDentifer *gjobSeekerID ;
        IDentifer *gjobID;
}

-(JobApplicationCoreFields*) initWithJobID:(IDentifer*)jobID andJobSeekerID:(IDentifer*)jobSeekerID;
-(void) updateJobApplicationModel:(id<IJobApplication>)jobApplication;
-(NSString*)appendJobApplicationReportRecordTo:(id<IReportStringGenerator>)reportString;
-(void)applyForJob:(id<IJobApplication>)jobApplication;
@end
