//
//  Jobseeker.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "Jobseeker.h"

@implementation Jobseeker{
    NSString *gReportString;
}
-(Jobseeker*) initWithID:(JobSeekerIDName*)jobSeekerIDName andResumeArray:(Resumes*)resumes{
    
    self = [super init];
    gjobSeekerIDName = jobSeekerIDName;
    gresumes = resumes;
    return self;
}
-(void) saveJob:(id<IJob>)job{
    [gjobSeekerIDName saveJob:job];
}

-(SavedJobs*) seeSavedJobs{

    return [gjobSeekerIDName seeSavedJobs];
}

-(void) applyForJob:(id<IJobApplication>)jobApplication WithResume:(Resume *)resume{
    
}

-(JobApplications *) seeAppliedJobs{

    return [gjobSeekerIDName seeAppliedJobs];
}

-(Resumes*)getAllResumeForJobseeker{
    
    return gresumes;
}

-(void)callToAppendJobSeekerToJobApplicationReport:(JobApplicationCoreFields*)jobApplicationCoreFields{
    
    [gjobSeekerIDName callToAppendJobSeekerToJobApplicationReport:self];
    [jobApplicationCoreFields appendToReportString:gReportString];
}

-(void)appendToReportString:(NSString*)reportSubString{
//    if(gReportString==nil){
        gReportString = @"";
//    }
    gReportString = [gReportString stringByAppendingString:reportSubString];
}
@end
