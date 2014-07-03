//
//  ReportGenerationTests.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JobApplicationReport.h"
#import "IReport.h"
#import "CSVReportGenerator.h"
#import "HTMLReportGenerator.h"

@interface ReportGenerationTests : XCTestCase
@end

@implementation ReportGenerationTests{
    
    JobApplicationReport *jobApplicationReport;
}

- (void)setUp {
    [super setUp];
    jobApplicationReport = [[JobApplicationReport alloc]init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPrepareDailyJobReport{
    

    NSString *jobPostedDateString = [self getTodayDateString];
    JobApplications *returnArray = [jobApplicationReport prepareDailyJobReport:[[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]]];
    
    XCTAssert([returnArray isKindOfClass:[JobApplications class]], @"Should return array of jobs");
    
    
    CSVReportGenerator *cSVReportGenerator = [[CSVReportGenerator alloc]init];
    NSString *csvReportString = [cSVReportGenerator prepareReport:returnArray withTitle:jobPostedDateString];
    NSLog(@"CSV Report is:%@", csvReportString);
    HTMLReportGenerator *hTMLReportGenerator = [[HTMLReportGenerator alloc]init];
    NSString* hTMLReportString = [hTMLReportGenerator prepareReport:returnArray withTitle:jobPostedDateString];
    NSLog(@"HTML Report is:%@", hTMLReportString);
    
}

-(NSString *)getTodayDateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    JobPostedDate *jobPostedDate = [[JobPostedDate alloc]initByPostedDate:[NSDate date]];
    formatter.dateFormat = @"yyyyMMdd";
    return [formatter stringFromDate:jobPostedDate];
}

- (void)testPrepareAggregrateReportByJob{
    
    IDentifer *jobID = [[IDentifer alloc]initWithString:@"1345"];
    
    XCTAssert([[jobApplicationReport prepareAggregrateReportByJob:jobID] isKindOfClass:[JobApplications class]], @"Should return array of jobs");
}

- (void)testPrepareAggregrateReportByEmployer{
    
    IDentifer *employerID = [[IDentifer alloc]initWithString:@"333"];
    
    JobApplications *listOfJobApplications = [jobApplicationReport prepareAggregrateReportByEmployer:employerID];
    
    XCTAssertTrue(false, @"Should return array of jobs");

}

- (void)testPrepareJobApplicationReportByEmployer{
    IDentifer *employerID = [[IDentifer alloc]initWithString:@"333"];
//    [[jobApplicationReport prepareJobApplicationReportByEmployer:employerID] isKindOfClass:[MutableArrayWrap class]
    XCTAssertTrue(false, @"Should return array of jobs");
    
}

@end
