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
#import "JobApplicationCoreFields.h"
#import "JReqJobApplication.h"
#import "IJobApplication.h"
#import "ATSJobApplication.h"
#import "EmployerModel.h"
#import "JreqJob.h"
#import "ATSJob.h"
#import"Jobseeker.h"
#import "JobSeekerRepositiory.h"
#import "JAModel.h"
#import "JSModel.h"
#import "JobApplicationDate.h"

@interface ReportGenerationTests : XCTestCase
@end

@implementation ReportGenerationTests{
    
    JobApplicationReport *jobApplicationReport;
    id<IJob> job;
    Jobseeker *jobSeeker;
    Employer *employer;
    IDentifer *employerID;
}

- (void)setUp {
    [super setUp];
    jobApplicationReport = [[JobApplicationReport alloc]init];
    
    [[JobSeekerRepositiory sharedInstance]initTheJobSeekerRepo];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPrepareDailyJobReport{
    
    [self prepareForTest];
    
    NSString *jobPostedDateString = [self getTodayDateString];
    jobApplicationReport = [[JobApplicationReport alloc]init];
    JobApplications *jobApplications = [jobApplicationReport prepareDailyJobReport:[[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]]];

    CSVReportGenerator *cSVReportGenerator = [[CSVReportGenerator alloc]init];
    NSString *csvReportString = [cSVReportGenerator prepareReport:jobApplications withTitle:jobPostedDateString];
    NSLog(@"CSV Report is:%@", csvReportString);
//    XCTAssertTrue([csvReportString isEqualToString:@"Job Application Report,20140714\nJOB SEEKER, JOB DETAILS, APP DATE\nJSFIRST Jay, Test JReq Job-EMPFIRST Jay, 14Jul2014"],@"");
    
    HTMLReportGenerator *hTMLReportGenerator = [[HTMLReportGenerator alloc]init];
    NSString* hTMLReportString = [hTMLReportGenerator prepareReport:jobApplications withTitle:jobPostedDateString];
    NSLog(@"HTML Report is:%@", hTMLReportString);
//    XCTAssertTrue([hTMLReportString isEqualToString:@"<p>Job Application Report: 20140714</p><table><tr><th>JOB SEEKER</th><th>JOB DETAILS</th><th>APP DATE</th></tr><tr><td>JSFIRST Jay</td><td>Test JReq Job-EMPFIRST Jay</td><td>14Jul2014</td></tr></table>"],@"");
}

-(NSString *)getTodayDateString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    JobPostedDate *jobPostedDate = [[JobPostedDate alloc]initByPostedDate:[NSDate date]];
    formatter.dateFormat = @"yyyyMMdd";
    return [formatter stringFromDate:jobPostedDate];
}

- (void)testPrepareAggregrateReportByJob{
    [self prepareForTest];
    jobApplicationReport = [[JobApplicationReport alloc]init];
    NSString *reportString = [jobApplicationReport prepareAggregrateReportByJob];
 
    NSLog(@"AggregrateReportByJob is: %@", reportString);
}

- (void)testPrepareAggregrateReportByJobByEmployer{
  
    [self prepareForTest];
    jobApplicationReport = [[JobApplicationReport alloc]init];
    NSString *reportString = [jobApplicationReport prepareAggregrateReportByEmployer];
    
    NSLog(@"AggregrateReportByJobByEmployer is: %@", reportString);
}

-(void)resetJAAndJSModel{
    [[JAModel sharedInstance]reset];
    [[JSModel sharedInstance]reset];
}

-(void)prepareForTest{
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    employerID = [[IDentifer alloc]initWithInteger:333];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    employer = [[Employer alloc]initWithEmployerID:employerID andDisplayName:jobPosterName];
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    id<IJob>job1 = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job1 andID:jobID1];
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:246];//DIFFERENT JOB
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName2];
    id<IJob>job2 = [[ATSJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job2 andID:jobID2];
    
    IDentifer *jobID3 = [[IDentifer alloc]initWithInteger:137];//DIFFERENT JOB
    JobDisplayName *jobName3 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job2" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData3 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName3 = [[JobIDName alloc]initWithJobID:jobID3 AndName:jobName3];
    id<IJob>job3 = [[JreqJob alloc]initWithIDName:jobIDName3 AndMetaData:jobMetaData3];
    [employer postJobWithName:jobName3 withJobType:job3 andID:jobID3];
    
    IDentifer *jobID4 = [[IDentifer alloc]initWithInteger:248];//DIFFERENT JOB
    JobDisplayName *jobName4 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job2" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData4 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName4 = [[JobIDName alloc]initWithJobID:jobID4 AndName:jobName4];
    id<IJob>job4 = [[ATSJob alloc]initWithIDName:jobIDName4 AndMetaData:jobMetaData4];
    [employer postJobWithName:jobName4 withJobType:job4 andID:jobID4];
    
    
    
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    //    APPLYING FOR JOB
    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID1];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    id<IJobApplication> jobApplication1 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];
    [jobApplicationCoreFields1 applyForJob:jobApplication1 withResumeID:resumeID1];
    
    
    //    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID1];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:0];//NO RESUME
    JobAppliedDateResume *jobAppliedDateResume2 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID2];
    id<IJobApplication> jobApplication2 = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withJobAppliedDateResumeID:jobAppliedDateResume2];
    [jobApplicationCoreFields2 applyForJob:jobApplication2 withResumeID:resumeID2];
    
    //    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields3 = [[JobApplicationCoreFields alloc]initWithJobID:jobID3 andJobSeekerID:jobSeekerID1];
    IDentifer *resumeID3 = [[IDentifer alloc]initWithInteger:440];
    JobAppliedDateResume *jobAppliedDateResume3 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID3];
    id<IJobApplication> jobApplication3 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields3 withJobAppliedDateResumeID:jobAppliedDateResume3];
    [jobApplicationCoreFields3 applyForJob:jobApplication3 withResumeID:resumeID3];
    
    
    //    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields4 = [[JobApplicationCoreFields alloc]initWithJobID:jobID4 andJobSeekerID:jobSeekerID1];
    IDentifer *resumeID4 = [[IDentifer alloc]initWithInteger:0];//NO RESUME
    JobAppliedDateResume *jobAppliedDateResume4 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID4];
    id<IJobApplication> jobApplication4 = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields4 withJobAppliedDateResumeID:jobAppliedDateResume4];
    [jobApplicationCoreFields4 applyForJob:jobApplication4 withResumeID:resumeID4];

    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:1];
    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:778];
    JobApplicationCoreFields *jobApplicationCoreFields5 = [[JobApplicationCoreFields alloc]initWithJobID:jobID4 andJobSeekerID:jobSeekerID2];
    IDentifer *resumeID5 = [[IDentifer alloc]initWithInteger:0];//NO RESUME
    JobAppliedDateResume *jobAppliedDateResume5 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID5];
    id<IJobApplication> jobApplication5 = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields5 withJobAppliedDateResumeID:jobAppliedDateResume5];
    [jobApplicationCoreFields5 applyForJob:jobApplication5 withResumeID:resumeID5];
    
}

@end
