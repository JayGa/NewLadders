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

@interface JobseekerTest : XCTestCase{
    
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *resumeID;
    IDentifer *employerID;
    Resume  *resume;
    IDentifer *jobID;
    id<IJob> job;
}

@end

@implementation JobseekerTest

- (void)setUp {
    [super setUp];
    jobSeeker = [[Jobseeker alloc]init];
    jobSeeker.jobseekerID = [[IDentifer alloc]initWithString:@"777"];
    resume = [[Resume alloc]init];
    resumeID = [[IDentifer alloc]initWithString:@"345"];
    employerID = [[IDentifer alloc]initWithString:@"1234"];
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
    job = [[JreqJob alloc]init];
    job.jobID = jobID;
    JobMetaData *tempJobMetaData = [[JobMetaData alloc]init];
    [tempJobMetaData setJobPosterID:employerID];
    [tempJobMetaData setJobPostedDate: [[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    [job setJobID:[job generateJobID]];
    [job setJobName:@"Save JReqJob"];
    [job setJobMetaData:tempJobMetaData];
    XCTAssertTrue([jobSeeker saveJob:job], @"Should return true");

}


- (void) testSaveATSJob{
    job = [[ATSJob alloc]init];
    job.jobID = jobID;
    JobMetaData *tempJobMetaData = [[JobMetaData alloc]init];
    [tempJobMetaData setJobPosterID:employerID];
    [tempJobMetaData setJobPostedDate: [[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    [job setJobID:[job generateJobID]];
    [job setJobName:@"Save ATSJob"];
    [job setJobMetaData:tempJobMetaData];
    XCTAssertTrue([jobSeeker saveJob:job], @"Should return true");
    
}

- (void) testSeeSavedJobs{

     XCTAssert([[jobSeeker seeSavedJobs] isKindOfClass:[NSArray class]], @"Should return a NSArray");
}

- (void)testApplyForJreqJob{
    jobID = [[IDentifer alloc]initWithString:@"1345"];
    jobApplication = [[JReqJobApplication alloc]init];
    jobApplication.jobID = jobID;
    XCTAssertTrue([jobSeeker applyForJob: jobApplication WithResume:resume], @"Should return true");
}

- (void)testApplyForATSJob{
    jobID = [[IDentifer alloc]initWithString:@"2345"];
    jobApplication = [[ATSJobApplication alloc]init];
    jobApplication.jobID = jobID;
    XCTAssertTrue([jobSeeker applyForJob:jobApplication WithResume:nil], @"Should return true");
}

- (void) testSeeAppliedJobs{

     XCTAssert([[jobSeeker seeAppliedJobs] isKindOfClass:[NSArray class]], @"Should return a NSArray");
}

@end
