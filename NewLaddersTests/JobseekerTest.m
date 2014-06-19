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

@interface JobseekerTest : XCTestCase{
    
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *resumeID;
    Resume  *resume;
    IDentifer *jobID;
}

@end

@implementation JobseekerTest

- (void)setUp {
    [super setUp];
    jobSeeker = [[Jobseeker alloc]init];
    resume = [[Resume alloc]init];
    resumeID = [[IDentifer alloc]initWithString:@"345"];
    jobID = [[IDentifer alloc]initWithString:@"234"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    jobSeeker = nil;
    resumeID = nil;
    jobID = nil;
}


- (void) testSaveJob{
    
    XCTAssertTrue([jobSeeker saveJob:jobID], @"Should return true");

}

- (void) testSeeSavedJobs{

     XCTAssert([[jobSeeker seeSavedJobs] isKindOfClass:[NSArray class]], @"Should return a NSArray");
}

- (void)testApplyForJreqJob{
    
    jobApplication = [[JReqJobApplication alloc]init];
    XCTAssert([jobSeeker applyForJob: jobApplication WithResume:resume], @"Should return true");
}

- (void)testApplyForATSJob{
    
    jobApplication = [[ATSJobApplication alloc]init];
    XCTAssert([jobSeeker applyForJob:jobApplication WithResume:nil], @"Should return true");
}

- (void) testSeeAppliedJobs{

     XCTAssert([[jobSeeker seeAppliedJobs] isKindOfClass:[NSArray class]], @"Should return a NSArray");
}

@end
