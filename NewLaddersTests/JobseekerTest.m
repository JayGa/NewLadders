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
#import "MutableArrayWrap.h"
#import "EmployerModel.h"

@interface JobseekerTest : XCTestCase{
    
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *resumeID;
    IDentifer *employerID;
    Resume  *resume;
    IDentifer *jobID;
    id<IJob> job;
    MutableArrayWrap *tempJobsArray;
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

     XCTAssert([[jobSeeker seeSavedJobs] isKindOfClass:[MutableArrayWrap class]], @"Should return a MutableArrayWrap");
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
    MutableArrayWrap  *tempArray = [jobSeeker seeAppliedJobs];
     XCTAssert([[jobSeeker seeAppliedJobs] isKindOfClass:[MutableArrayWrap class]], @"Should return a MutableArrayWrap");
    NSLog(@"In testSeeAppliedJobs :%@", tempArray );
    for(int i=0; i< [tempArray count]; i++ ){
//        NSLog(@"Element is:%@", [(id<IJob>)[tempArray objectAtIndex:i]jobID]);
    }
}

@end
