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

@interface JobseekerTest : XCTestCase{
    
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *jobID;
    Resume  *resume;
}

@end

@implementation JobseekerTest

- (void)setUp {
    [super setUp];
    jobSeeker = [[Jobseeker alloc]init];
    jobID = [[IDentifer alloc]initWithString:@"345"];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}




-(BOOL) testSaveJob{

    
    XCTAssertTrue([jobSeeker saveJob:jobID], @"Should return true");

}

-(NSArray*) testSeeSavedJobs{

     XCTAssert([[jobSeeker seeSavedJobs] isKindOfClass:[NSArray class]], @"Should return a NSArray");
}

-(BOOL)testApplyForJob:(id<IJobApplication>)jobApplication WithResume:(Resume *)resume{
    
//    applyForJob:(id<IJobApplication>)jobApplication WithResume:(Resume *)resume

    XCTAssert([jobSeeker applyForJob:jobID WithResume:resume], @"Should return true");
}

-(void) testSeeAppliedJobs{

     XCTAssert([[jobSeeker seeAppliedJobs] isKindOfClass:[NSArray class]], @"Should return a NSArray");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
