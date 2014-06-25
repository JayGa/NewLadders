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

@interface JobseekerTest : XCTestCase{
    
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *resumeID;
    IDentifer *employerID;
    Resume  *resume;
    IDentifer *jobID;
    id<IJob> job;
    PostedJobs *tempJobsArray;
}

@end

@implementation JobseekerTest

- (void)setUp {
    [super setUp];
    jobSeeker = [[Jobseeker alloc]init];
    jobSeeker.jobseekerID = [[IDentifer alloc]initWithString:@"777"];
    resume = [[Resume alloc]init];
    resumeID = [[IDentifer alloc]initWithString:@"345"];
    employerID = [[IDentifer alloc]initWithString:@"333"];
    tempJobsArray = [[EmployerModel sharedInstance].employerJobMutableDict objectForKey:employerID];
    
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
    
    NSString*returnString = [jobSeeker saveJob:[tempJobsArray objectAtIndex:0]];
    XCTAssertTrue([returnString isEqualToString:@"2345"], @"Should return true");

}


- (void) testSaveATSJob{

    NSString*returnString = [jobSeeker saveJob:[tempJobsArray objectAtIndex:1]];
    XCTAssertTrue([returnString isEqualToString:@"1345"], @"Should return true");
}

- (void) testSeeSavedJobs{

    SavedJobs  *tempArray = [jobSeeker seeSavedJobs];
    NSMutableArray *testArray = [[NSMutableArray alloc]initWithObjects:@"1345", @"2345", nil];
    
    for(int i=0; i< [tempArray count]; i++ ){
//        NSLog(@"In testSeeAppliedJobs Element is:%@", [[(id<IJob>)[tempArray objectAtIndex:i] jobIDName] jobID]);
        XCTAssert([[[(id<IJob>)[tempArray objectAtIndex:i ]jobIDName]jobID] isEqualToString:[testArray objectAtIndex:i]], @"Should be True");
    }
    
}

- (void)testApplyForJreqJob{
    jobID = [[IDentifer alloc]initWithString:@"1345"];
    jobApplication = [[JReqJobApplication alloc]init];
    jobApplication.jobID = jobID;
    jobApplication.jobseekerID = jobSeeker.jobseekerID;
    NSString *returnString = [jobSeeker applyForJob: jobApplication WithResume:resume];
    XCTAssertTrue([returnString isEqualToString:@"1345"] , @"Should return true");
}

- (void)testApplyForATSJob{
    jobID = [[IDentifer alloc]initWithString:@"2345"];
    jobApplication = [[ATSJobApplication alloc]init];
    jobApplication.jobID = jobID;
    jobApplication.jobseekerID = jobSeeker.jobseekerID;
    NSString *returnString = [jobSeeker applyForJob:jobApplication WithResume:nil];
    XCTAssertTrue([returnString isEqualToString:@"2345"], @"Should return true");
}

- (void) testSeeAppliedJobs{
    JobApplications  *tempArray = [jobSeeker seeAppliedJobs];
    NSMutableArray *testArray = [[NSMutableArray alloc]initWithObjects:@"2345", @"1345", nil];

    for(int i=0; i< [tempArray count]; i++ ){
//        NSLog(@"In testSeeAppliedJobs Element is:%@", [(id<IJobApplication>)[tempArray objectAtIndex:i]jobID]);
        XCTAssert([[(id<IJobApplication>)[tempArray objectAtIndex:i ]jobID] isEqualToString:[testArray objectAtIndex:i]], @"Should be True");
    }
}

@end
