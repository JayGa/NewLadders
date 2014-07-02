//
//  JobSeekerIDName.h
//  NewLadders
//
//  Created by Jay Gaonkar on 7/2/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDentifer.h"
#import "DisplayName.h"
#import "IJobApplication.h"
#import "IJob.h"
#import "SavedJobs.h"
#import "JobApplications.h"

@interface JobSeekerIDName : NSObject{
    
    IDentifer *gjobSeekerID;
    DisplayName *gjobSeekerName;
}
-(JobSeekerIDName*)initWithID:(IDentifer*)jobSeekerID andName:(DisplayName*)displayName;

-(void) saveJob:(id<IJob>)job;
-(SavedJobs*) seeSavedJobs;
-(JobApplications*) seeAppliedJobs;

@end
