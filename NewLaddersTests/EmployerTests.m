//
//  EmployerTests.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/18/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "Employer.h"
#import "IJob.h"
#import "JreqJob.h"
#import "ATSJob.h"
#import "IDentifer.h"

@interface EmployerTests : XCTestCase

@end

@implementation EmployerTests{
        Employer *employer;
        id<IJob> job;
}

- (void)setUp {
    [super setUp];
    employer = [Employer new];
    employer.employerID = [[IDentifer alloc]initWithString:@"1234"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJReqJob {
    // This is an example of a functional test case.
    
    job = [[JreqJob alloc]init];
    BOOL result = [employer postJReqJobWithName:@"Test Job" withJobType:job];
    NSLog(@"In testJReqJob :%d", result);
    XCTAssert(result, @"Should return True");
}

- (void)testATSJob {
    // This is an example of a functional test case.
    
    job = [[ATSJob alloc]init];
    BOOL result = [employer postATSJobWithName:@"Test Job" withJobType:job];
    XCTAssert(result, @"Should return True");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end