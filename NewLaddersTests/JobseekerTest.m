//
//  JobseekerTest.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Jobseeker.h"
#import "IJob.h"
#import "Resume.h"
#import "JReqJobApplication.h"
#import "ATSJobApplication.h"
#import "JReqJob.h"
#import "ATSJob.h"
#import "JobIDName.h"
#import "EmployerModel.h"
#import "JSModel.h"
#import "JAModel.h"

@interface JobseekerTest : XCTestCase{
    
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *resumeID;
    IDentifer *employerID;
    IDentifer *jobSeekerID;
    Resume  *resume;
    IDentifer *jobID;
    id<IJob> job;
    PostedJobs *postedJobs;
    SavedJobs *savedJobs;
}

@end

@implementation JobseekerTest

- (void)setUp {
    [super setUp];
    jobSeeker = [[Jobseeker alloc]init];
    jobSeekerID = [[IDentifer alloc]initWithString:@"777"];
    resumeID = [[IDentifer alloc]initWithString:@"440"];
    employerID = [[IDentifer alloc]initWithString:@"333"];
    postedJobs = [[EmployerModel sharedInstance]->employerJobMutableDict getJobsPostedByEmployerWithID:employerID];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    jobSeeker = nil;
    resumeID = nil;
    jobID = nil;
}


- (void) testSaveJReqJob{
    
    [jobSeeker saveJob:[tempJobsArray objectAtIndex:0]];
    XCTAssertTrue([returnString isEqualToString:@"2345"], @"Should return true");

}


- (void) testSaveATSJob{

    NSString*returnString = [jobSeeker saveJob:[tempJobsArray objectAtIndex:1]];
    XCTAssertTrue([returnString isEqualToString:@"1345"], @"Should return true");
}

- (void) testSeeSavedJobs{

    SavedJobs  *savedJobs = [jobSeeker seeSavedJobs];
    NSMutableArray *testArray = [[NSMutableArray alloc]initWithObjects:@"1345", @"2345", nil];
    
    for(int i=0; i< [savedJobs count]; i++ ){
//        NSLog(@"In testSeeAppliedJobs Element is:%@", [[(id<IJob>)[tempArray objectAtIndex:i] jobIDName] jobID]);
        XCTAssert([[[(id<IJob>)[savedJobs savedJobAtIndex:i]jobIDName]jobID] isEqualToString:[testArray objectAtIndex:i]], @"Should be True");
    }
    
}

- (void)testApplyForJreqJob{
    jobID = [[IDentifer alloc]initWithString:@"1345"];
    
    jobApplication = [[JReqJobApplication alloc]initWithJobseekerId:jobSeekerID forJObID:jobID withOptionalResumeID:resumeID];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplication applyForJob];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertTrue( (afterAppliedJobCount - beforeAppliedJobCount)==1, @"Should return True");
    XCTAssertTrue( (afterJobApplicationCount - beforeJobApplicationCount)==1, @"Should return True");
    XCTAssertTrue( (afterJobApplicationByDayCount - beforeJobApplicationByDayCount)==1, @"Should return True");
}

- (void)testApplyForATSJob{
    jobID = [[IDentifer alloc]initWithString:@"2345"];
    
    jobApplication = [[ATSJobApplication alloc]initWithJobseekerId:jobSeekerID forJObID:jobID withOptionalResumeID:nil];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplication applyForJob];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertTrue( (afterAppliedJobCount - beforeAppliedJobCount)==1, @"Should return True");
    XCTAssertTrue( (afterJobApplicationCount - beforeJobApplicationCount)==1, @"Should return True");
    XCTAssertTrue( (afterJobApplicationByDayCount - beforeJobApplicationByDayCount)==1, @"Should return True");
}

- (void) testSeeAppliedJobs{
    JobApplications  *jobApplicationsArray = [jobSeeker seeAppliedJobs];
    NSMutableArray *testArray = [[NSMutableArray alloc]initWithObjects:@"2345", @"1345", nil];

    for(int i=0; i< [jobApplicationsArray count]; i++ ){
//        NSLog(@"In testSeeAppliedJobs Element is:%@", [(id<IJobApplication>)[tempArray objectAtIndex:i]jobID]);
        XCTAssert([(id<IJobApplication>)[jobApplicationsArray jobApplicationAtIndex:i] isKindOfClass:[JReqJobApplication class]], @"Should be True");
    }
}

@end
