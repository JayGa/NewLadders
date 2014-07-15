//
//  JobseekerTest.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/19/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <XCTest/XCTest.h>

//#import "IJob.h"
#import "Resume.h"
#import "JReqJobApplication.h"
#import "ATSJobApplication.h"
#import "JReqJob.h"
#import "ATSJob.h"
#import "JobIDName.h"
#import "EmployerModel.h"
#import "JSModel.h"
#import "JAModel.h"
#import "Employer.h"
#import "JobSeekerIDName.h"
#import "UserDisplayName.h"
#import "JobSeekerRepositiory.h"
#import "JobIDGenerator.h"

@class Jobseeker;
@class IJob;
@class IJobApplication;

@interface JobseekerTest : XCTestCase{
    
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *resumeID;
    IDentifer *employerID;
    IDentifer *jobSeekerID;
    IDentifer *jobID;
    Employer *employer;
    Resume  *resume;
    id<IJob> job;
    PostedJobs *postedJobs;
    NSString *jobName;
}

@end

@implementation JobseekerTest

- (void)setUp {
    [super setUp];
    
    [[JobSeekerRepositiory sharedInstance]initTheJobSeekerRepo];
    
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    employerID = [[IDentifer alloc]initWithInteger:333];
    postedJobs = [[EmployerModel sharedInstance] getPostedJobsForEmployerID:employerID];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"First"];

    employer = [[Employer alloc]initWithEmployerID:employerID andDisplayName:jobPosterName];

#warning Use id generate method or hard code job IDs.
//    IDentifer *jobID1 = [[JobIDGenerator sharedInstance]generateATSJobID];
    
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JreqJob *job1 = [[JreqJob alloc]init];
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:135] AndName:jobName1];
    job1 = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job1 andID:jobID1];
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:246];
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName];
    ATSJob *job2 = [[ATSJob alloc]init];
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:246] AndName:jobName2];
    job2 = [[ATSJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job2 andID:jobID2];
    
    IDentifer *jobID3 = [[IDentifer alloc]initWithInteger:137];
    JobDisplayName *jobName3 = [[JobDisplayName alloc]initWithJob:@"Second Test JReq Job" andPoster:jobPosterName];
    JreqJob *job3 = [[JreqJob alloc]init];
    JobMetaData *jobMetaData3 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName3 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:579] AndName:jobName3];
    job3 = [[JreqJob alloc]initWithIDName:jobIDName3 AndMetaData:jobMetaData3];
    [employer postJobWithName:jobName3 withJobType:job3 andID:jobID3];
    
    IDentifer *jobID4 = [[IDentifer alloc]initWithInteger:248];
    JobDisplayName *jobName4 = [[JobDisplayName alloc]initWithJob:@"Second Test ATS Job" andPoster:jobPosterName];
    ATSJob *job4 = [[ATSJob alloc]init];
    JobMetaData *jobMetaData4 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName4 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:680] AndName:jobName4];
    job4 = [[ATSJob alloc]initWithIDName:jobIDName4 AndMetaData:jobMetaData4];
    [employer postJobWithName:jobName4 withJobType:job4 andID:jobID4];
    
    postedJobs = [[EmployerModel sharedInstance]jobsPostedByEmployerWithID:employerID];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    jobSeeker = nil;
    resumeID = nil;
}


- (void) testSaveJReqJob{
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];

    
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];
    
    [[EmployerModel sharedInstance]reset];
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    [jobSeeker saveJob:job];
    
    SavedJobs  *savedJobs = [jobSeeker seeSavedJobs];
    id<IJob> savedJob1 = [savedJobs savedJobAtIndex:0];
    NSLog(@"Saved job1 is: %@", [savedJob1 appendJobDisplayName]);
    XCTAssertTrue([[savedJob1 appendJobDisplayName] isEqualToString: @"Test JReq Job1-EMPFIRST Jay"], @"");
}


- (void) testSaveATSJob{
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:246];
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[ATSJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];
    
    
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    [jobSeeker saveJob:job];
    SavedJobs  *savedJobs = [jobSeeker seeSavedJobs];
    id<IJob> savedJob1 = [savedJobs savedJobAtIndex:0];
    NSLog(@"Saved job1 is: %@", [savedJob1 appendJobDisplayName]);
    XCTAssertTrue([[savedJob1 appendJobDisplayName] isEqualToString: @"Test ATS Job1-EMPFIRST Jay"], @"");

}


- (void) testSeeSavedJobs{
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:246];
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[ATSJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];
    //SAVE JOB
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    [jobSeeker saveJob:job];
    
    //    POSTING JOB
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:135];
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:jobID2 AndName:jobName2];
    job = [[JreqJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job andID:jobID2];
    //SAVE JOB
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    [jobSeeker saveJob:job];
    
    SavedJobs  *savedJobs = [jobSeeker seeSavedJobs];
    
    id<IJob> savedJob1 = [savedJobs savedJobAtIndex:0];
    NSLog(@"Saved job1 is: %@", [savedJob1 appendJobDisplayName]);
    XCTAssertTrue([[savedJob1 appendJobDisplayName] isEqualToString: @"Test ATS Job-EMPFIRST Jay"], @"");

    id<IJob> savedJob2 = [savedJobs savedJobAtIndex:1];
    NSLog(@"Saved job2 is: %@", [savedJob2 appendJobDisplayName]);
    XCTAssertTrue([[savedJob2 appendJobDisplayName] isEqualToString: @"Test JReq Job-EMPFIRST Jay"], @"");
//    XCTAssertEqual([savedJobs count], 2, @"");
}

- (void)testApplyForJreqJobWithCorrectResume{

    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];
    
    
    //    APPLYING FOR JOB
    Jobseeker *jobSeeker1 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID1];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    id<IJobApplication> jobApplication1 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];
    [jobApplicationCoreFields1 applyForJob:jobApplication1 withResumeID:resumeID1];
    
    Jobseeker *jobSeeker2 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:1];
    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:778];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID2];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:450];
    JobAppliedDateResume *jobAppliedDateResume2 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID2];
     id<IJobApplication> jobApplication2 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withJobAppliedDateResumeID:jobAppliedDateResume2];
    [jobApplicationCoreFields2 applyForJob:jobApplication2 withResumeID:resumeID2];


    JobApplications  *jobApplicationsCollection = [jobSeeker1 seeAppliedJobs];
    
    id<IJobApplication> testJobApplication = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"Applied jobs are:%@", [testJobApplication prepareJobApplicationReport]);
    XCTAssertTrue([[testJobApplication prepareJobApplicationReport] isEqualToString:@"JSFIRST Jay,Test JReq Job1-EMPFIRST Jay"], @"Should be True");

}

- (void)testApplyForJreqJobWithOtherPersonsResume{
    
    [self resetJAAndJSModel];
    
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:450];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
        JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];//Resume belongs to different user.
    
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertEqual(afterAppliedJobCount - beforeAppliedJobCount, 0, @"");
    XCTAssertEqual(afterJobApplicationCount - beforeJobApplicationCount, 0, @"");
    XCTAssertEqual(afterJobApplicationByDayCount - beforeJobApplicationByDayCount, 0, @"");
}


- (void)testApplyForJreqJobWithNOResume{
    
    [self resetJAAndJSModel];
    
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
//    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
           JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:nil];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];//NO RESUME
    
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:nil];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertEqual(afterAppliedJobCount - beforeAppliedJobCount, 0, @"");
    XCTAssertEqual(afterJobApplicationCount - beforeJobApplicationCount, 0, @"");
    XCTAssertEqual(afterJobApplicationByDayCount - beforeJobApplicationByDayCount, 0, @"");

}

- (void)testApplyForDifferentJreqJobWithDifferentResume{
    
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];

    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:137];//DIFFERENT JOB
    
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Second Test JReq Job2" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName2];
    job = [[JreqJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job andID:jobID2];
    
    
    //    APPLYING FOR JOB
    Jobseeker *jobSeeker1 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID1];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:441];//DIFFERENT RESUME
    JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    id<IJobApplication> jobApplication1 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];
    [jobApplicationCoreFields1 applyForJob:jobApplication1 withResumeID:resumeID1];
    
    Jobseeker *jobSeeker2 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:1];
    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:778];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID2];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:450];
    JobAppliedDateResume *jobAppliedDateResume2 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID2];
    id<IJobApplication> jobApplication2 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withJobAppliedDateResumeID:jobAppliedDateResume2];
    [jobApplicationCoreFields2 applyForJob:jobApplication2 withResumeID:resumeID2];
    
    
    JobApplications  *jobApplicationsCollection = [jobSeeker1 seeAppliedJobs];
    
    id<IJobApplication> testJobApplication = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"Applied jobs are:%@", [testJobApplication prepareJobApplicationReport]);
    XCTAssertTrue([[testJobApplication prepareJobApplicationReport] isEqualToString:@"JSFIRST Jay,Second Test JReq Job2-EMPFIRST Jay"], @"Should be True");

}

- (void)testApplyForATSJob{
    
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:246];
    
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[ATSJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];
    
    
    //    APPLYING FOR JOB
    Jobseeker *jobSeeker1 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID1];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:0];
    JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    id<IJobApplication> jobApplication1 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];
    [jobApplicationCoreFields1 applyForJob:jobApplication1 withResumeID:resumeID1];
    
    Jobseeker *jobSeeker2 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:1];
    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:778];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID2];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:0];
    JobAppliedDateResume *jobAppliedDateResume2 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID2];
    id<IJobApplication> jobApplication2 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withJobAppliedDateResumeID:jobAppliedDateResume2];
    [jobApplicationCoreFields2 applyForJob:jobApplication2 withResumeID:resumeID2];
    
    
    JobApplications  *jobApplicationsCollection = [jobSeeker1 seeAppliedJobs];
    
    id<IJobApplication> testJobApplication = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"Applied ATS job is:%@", [testJobApplication prepareJobApplicationReport]);
    XCTAssertTrue([[testJobApplication prepareJobApplicationReport] isEqualToString:@"JSFIRST Jay,Test ATS Job1-EMPFIRST Jay"], @"Should be True");
}

- (void)testApplyForATSJobWithResume{
    
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:246];
    
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[ATSJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];
    
    
    //    APPLYING FOR JOB
    Jobseeker *jobSeeker1 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID1];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];//WITH RESUMR FOR ATS
    JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    id<IJobApplication> jobApplication1 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];
    [jobApplicationCoreFields1 applyForJob:jobApplication1 withResumeID:resumeID1];
    
    Jobseeker *jobSeeker2 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:1];
    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:778];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID2];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:0];
    JobAppliedDateResume *jobAppliedDateResume2 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID2];
    id<IJobApplication> jobApplication2 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withJobAppliedDateResumeID:jobAppliedDateResume2];
    [jobApplicationCoreFields2 applyForJob:jobApplication2 withResumeID:resumeID2];
    
    
    JobApplications  *jobApplicationsCollection = [jobSeeker1 seeAppliedJobs];
    
    id<IJobApplication> testJobApplication = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"Applied ATS job is:%@", [testJobApplication prepareJobApplicationReport]);
    XCTAssertTrue([[testJobApplication prepareJobApplicationReport] isEqualToString:@"JSFIRST Jay,Test ATS Job1-EMPFIRST Jay"], @"Should be True");
}

- (void)testApplyForDifferentATSJob{
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:246];
    
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job1" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[ATSJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:248];//DIFFERENT JOB
    
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Second Test ATS Job2" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName2];
    job = [[ATSJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job andID:jobID2];
    
    
    //    APPLYING FOR JOB
    Jobseeker *jobSeeker1 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID1];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:0];//DIFFERENT RESUME
    JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    id<IJobApplication> jobApplication1 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];
    [jobApplicationCoreFields1 applyForJob:jobApplication1 withResumeID:resumeID1];
    
    Jobseeker *jobSeeker2 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:1];
    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:778];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID2];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:0];//NO RESUME
    JobAppliedDateResume *jobAppliedDateResume2 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID2];
    id<IJobApplication> jobApplication2 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withJobAppliedDateResumeID:jobAppliedDateResume2];
    [jobApplicationCoreFields2 applyForJob:jobApplication2 withResumeID:resumeID2];
    
    
    JobApplications  *jobApplicationsCollection = [jobSeeker1 seeAppliedJobs];
    
    id<IJobApplication> testJobApplication = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"Applied jobs are:%@", [testJobApplication prepareJobApplicationReport]);
    XCTAssertTrue([[testJobApplication prepareJobApplicationReport] isEqualToString:@"JSFIRST Jay,Second Test ATS Job2-EMPFIRST Jay"], @"Should be True");
    
}

- (void) testSeeAppliedJobs{
    
    [self resetJAAndJSModel];
    [[EmployerModel sharedInstance]reset];
    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"EMPFirst"];
    
    //    POSTING JOB
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName1];
    job = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job andID:jobID1];
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:246];//DIFFERENT JOB
    
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName] ;
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:jobID1 AndName:jobName2];
    job = [[ATSJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job andID:jobID2];
    
    
    //    APPLYING FOR JOB
    Jobseeker *jobSeeker1 = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    IDentifer *jobSeekerID1 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID1];
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobAppliedDateResume *jobAppliedDateResume1 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID1];
    id<IJobApplication> jobApplication1 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withJobAppliedDateResumeID:jobAppliedDateResume1];
    [jobApplicationCoreFields1 applyForJob:jobApplication1 withResumeID:resumeID1];
    

    IDentifer *jobSeekerID2 = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields2 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID2];
    IDentifer *resumeID2 = [[IDentifer alloc]initWithInteger:0];//NO RESUME
    JobAppliedDateResume *jobAppliedDateResume2 = [[JobAppliedDateResume alloc]initWithAppliedDate:jobApplicationDate andResumeID:resumeID2];
    id<IJobApplication> jobApplication2 = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields2 withJobAppliedDateResumeID:jobAppliedDateResume2];
    [jobApplicationCoreFields2 applyForJob:jobApplication2 withResumeID:resumeID2];
    
    
    JobApplications  *jobApplicationsCollection = [jobSeeker1 seeAppliedJobs];
    
    
    id<IJobApplication> testJobApplication1 = [jobApplicationsCollection jobApplicationAtIndex:0];
    NSLog(@"Applied jobs are:%@", [testJobApplication1 prepareJobApplicationReport]);
    XCTAssertTrue([[testJobApplication1 prepareJobApplicationReport] isEqualToString:@"JSFIRST Jay,Test ATS Job-EMPFIRST Jay"], @"Should be True");

    id<IJobApplication> testJobApplication2 = [jobApplicationsCollection jobApplicationAtIndex:1];
    NSLog(@"Applied jobs are:%@", [testJobApplication2 prepareJobApplicationReport]);
    XCTAssertTrue([[testJobApplication2 prepareJobApplicationReport] isEqualToString:@"JSFIRST Jay,Test JReq Job-EMPFIRST Jay"], @"Should be True");
}

-(void)resetJAAndJSModel{
    [[JAModel sharedInstance]reset];
    [[JSModel sharedInstance]reset];
}
@end

