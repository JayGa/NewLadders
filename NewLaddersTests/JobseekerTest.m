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

@interface JobseekerTest : XCTestCase{
    
    id<IJobApplication> jobApplication;
    Jobseeker *jobSeeker;
    IDentifer *resumeID;
    IDentifer *employerID;
    IDentifer *jobSeekerID;
    Employer *employer;
    Resume  *resume;
    IDentifer *jobID;
    id<IJob> job;
    PostedJobs *postedJobs;
//    SavedJobs *savedJobs;
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
    UserDisplayName *employerDisplayName = [[UserDisplayName alloc]initWithFirstName:@"Employer" andLastName:@"Jay"];
    employerID = [[IDentifer alloc]initWithInteger:333];
    employer = [[Employer alloc]initWithEmployerID:employerID andDisplayName:employerDisplayName];

    UserDisplayName *jobPosterName = [[UserDisplayName alloc]initWithFirstName:@"Jay" andLastName:@"First"];
#warning Use id generate method or hard code job IDs.
    IDentifer *jobID = [[JobIDGenerator sharedInstance]generateATSJobID];
    
    JobDisplayName *jobName1 = [[JobDisplayName alloc]initWithJob:@"Test JReq Job" andPoster:jobPosterName];
    JreqJob *job1 = [[JreqJob alloc]init];
    JobMetaData *jobMetaData1 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName1 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:135] AndName:jobName1];
    job1 = [[JreqJob alloc]initWithIDName:jobIDName1 AndMetaData:jobMetaData1];
    [employer postJobWithName:jobName1 withJobType:job1];
    
    JobDisplayName *jobName2 = [[JobDisplayName alloc]initWithJob:@"Test ATS Job" andPoster:jobPosterName];
    ATSJob *job2 = [[ATSJob alloc]init];
    JobMetaData *jobMetaData2 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName2 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:246] AndName:jobName2];
    job2 = [[ATSJob alloc]initWithIDName:jobIDName2 AndMetaData:jobMetaData2];
    [employer postJobWithName:jobName2 withJobType:job2];
    
    JobDisplayName *jobName3 = [[JobDisplayName alloc]initWithJob:@"Second Test JReq Job" andPoster:jobPosterName];
    JreqJob *job3 = [[JreqJob alloc]init];
    JobMetaData *jobMetaData3 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName3 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:579] AndName:jobName3];
    job3 = [[JreqJob alloc]initWithIDName:jobIDName3 AndMetaData:jobMetaData3];
    [employer postJobWithName:jobName3 withJobType:job3];
    
    JobDisplayName *jobName4 = [[JobDisplayName alloc]initWithJob:@"Second test ATS Job" andPoster:jobPosterName];
    ATSJob *job4 = [[ATSJob alloc]init];
    JobMetaData *jobMetaData4 = [[JobMetaData alloc]initWithEmployerID:employerID AndPostedDate:[[JobPostedDate alloc]initByPostedDate:[NSDate date]]];
    JobIDName *jobIDName4 = [[JobIDName alloc]initWithJobID:[[IDentifer alloc]initWithInteger:680] AndName:jobName4];
    job4 = [[ATSJob alloc]initWithIDName:jobIDName4 AndMetaData:jobMetaData4];
    [employer postJobWithName:jobName4 withJobType:job4];
    
    postedJobs = [[EmployerModel sharedInstance]jobsPostedByEmployerWithID:employerID];
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
    [self resetJAAndJSModel];
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    NSUInteger beforeSavedJobs = [[JSModel sharedInstance]getNumberOfSavedJobsForJobSeekerID:jobSeekerID];
    [jobSeeker saveJob:[postedJobs postedJobAtIndex:0]];
    NSUInteger afterSavedJobs = [[JSModel sharedInstance]getNumberOfSavedJobsForJobSeekerID:jobSeekerID];
    XCTAssertTrue(afterSavedJobs- beforeSavedJobs == 1, @"");
}


- (void) testSaveATSJob{
    [self resetJAAndJSModel];
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    NSUInteger beforeSavedJobs = [[JSModel sharedInstance]getNumberOfSavedJobsForJobSeekerID:jobSeekerID];
    [jobSeeker saveJob:[postedJobs postedJobAtIndex:1]];
    NSUInteger afterSavedJobs = [[JSModel sharedInstance]getNumberOfSavedJobsForJobSeekerID:jobSeekerID];
    XCTAssertTrue(afterSavedJobs- beforeSavedJobs == 1, @"");
}


- (void) testSeeSavedJobs{
    [self resetJAAndJSModel];
    
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    [jobSeeker saveJob:[postedJobs postedJobAtIndex:0]];
    
    
    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    [jobSeeker saveJob:[postedJobs postedJobAtIndex:1]];
    

    jobSeeker = [[JobSeekerRepositiory sharedInstance]getJobSeekerAtIndex:0];
    SavedJobs  *savedJobs = [jobSeeker seeSavedJobs];
//    NSMutableArray *testArray = [[NSMutableArray alloc]initWithObjects:@"1345", @"2345", nil];
   XCTAssertEqual([savedJobs count], 2, @"");
}

- (void)testApplyForJreqJobWithCorrectResume{
    jobID = [[IDentifer alloc]initWithInteger:135];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];

    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertEqual((afterAppliedJobCount - beforeAppliedJobCount), 1, @"Should return True");
    XCTAssertEqual((afterJobApplicationCount - beforeJobApplicationCount), 1, @"Should return True");
    XCTAssertEqual((afterJobApplicationByDayCount - beforeJobApplicationByDayCount), 1, @"Should return True");
}


- (void)testApplyForJreqJobWithNOResume{
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
//    IDentifer *resumeID1 = [[IDentifer alloc]initWithString:@"440"];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:nil];//NO RESUME
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
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
    jobID = [[JobIDGenerator sharedInstance]generateJReqJobID];//Different JREQ JOB
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:441];//Different resume but belogs to the right jobseeker.
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertEqual(afterAppliedJobCount - beforeAppliedJobCount, 1, @"");
    XCTAssertEqual(afterJobApplicationCount - beforeJobApplicationCount, 1, @"");
    XCTAssertEqual(afterJobApplicationByDayCount - beforeJobApplicationByDayCount, 1, @"");
}

- (void)testApplyForATSJob{
    jobID = [[IDentifer alloc]initWithInteger:246];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
//    IDentifer *resumeID1 = [[IDentifer alloc]initWithString:@"440"];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertEqual((afterAppliedJobCount - beforeAppliedJobCount), 1, @"");
    XCTAssertEqual((afterJobApplicationCount - beforeJobApplicationCount), 1, @"");
    XCTAssertEqual((afterJobApplicationByDayCount - beforeJobApplicationByDayCount), 1, @"Should return True");
}

- (void)testApplyForATSJobWithResume{
    jobID = [[IDentifer alloc]initWithInteger:246];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
        IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];

    XCTAssertEqual( (afterAppliedJobCount - beforeAppliedJobCount), 1, @"Should return True");
    XCTAssertEqual( (afterJobApplicationCount - beforeJobApplicationCount), 1, @"Should return True");
    XCTAssertEqual( (afterJobApplicationByDayCount - beforeJobApplicationByDayCount), 1, @"Should return True");
}

- (void)testApplyForDifferentATSJob{
    jobID = [[IDentifer alloc]initWithInteger:680];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    //    IDentifer *resumeID1 = [[IDentifer alloc]initWithString:@"440"];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID andJobSeekerID:jobSeekerID];
    jobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    JobApplicationDate *jobApplicationDate = [[JobApplicationDate alloc]initWithJobApplicationDate:[NSDate date]];
    
    NSUInteger beforeAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger beforeJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger beforeJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    NSUInteger afterAppliedJobCount = [[JSModel sharedInstance]getNumberOfAppliedJobsForJobSeekerID:jobSeekerID];
    NSUInteger afterJobApplicationCount = [[JAModel sharedInstance] getNumberOfApplicationsByJobID:jobID];
    NSUInteger afterJobApplicationByDayCount = [[JAModel sharedInstance]getNumberOfApplicationsAppllicationDate:jobApplicationDate];
    
    XCTAssertEqual( (afterAppliedJobCount - beforeAppliedJobCount), 1, @"Should return True");
    XCTAssertEqual( (afterJobApplicationCount - beforeJobApplicationCount), 1, @"Should return True");
    XCTAssertEqual( (afterJobApplicationByDayCount - beforeJobApplicationByDayCount), 1, @"Should return True");
}

- (void) testSeeAppliedJobs{
    
    [self resetJAAndJSModel];
    
    IDentifer *jobID1 = [[IDentifer alloc]initWithInteger:135];
    
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    IDentifer *resumeID1 = [[IDentifer alloc]initWithInteger:440];
    JobApplicationCoreFields *jobApplicationCoreFields1 = [[JobApplicationCoreFields alloc]initWithJobID:jobID1 andJobSeekerID:jobSeekerID];
    jobApplication = [[JReqJobApplication alloc]initWithCoreFields:jobApplicationCoreFields1 withOptionalResumeID:resumeID1];
    [jobApplicationCoreFields1 applyForJob:jobApplication withResumeID:resumeID1];
    
    
    IDentifer *jobID2 = [[IDentifer alloc]initWithInteger:246];
    jobSeekerID = [[IDentifer alloc]initWithInteger:777];
    JobApplicationCoreFields *jobApplicationCoreFields3 = [[JobApplicationCoreFields alloc]initWithJobID:jobID2 andJobSeekerID:jobSeekerID];
    ATSJobApplication *atsJobApplication = [[ATSJobApplication alloc]initWithCoreFields:jobApplicationCoreFields3 withOptionalResumeID:[[IDentifer alloc]initWithInteger:0]];
    [jobApplicationCoreFields3 applyForJob:atsJobApplication withResumeID:[[IDentifer alloc]initWithInteger:0]];
    
    
    
    JobApplications  *jobApplicationsArray = [jobSeeker seeAppliedJobs];
    NSMutableArray *testArray = [[NSMutableArray alloc]initWithObjects:@"135", @"246", nil];

//    for(int i=0; i< [jobApplicationsArray count]; i++ ){
//        NSLog(@"In testSeeAppliedJobs Element is:%@", [(id<IJobApplication>)[tempArray objectAtIndex:i]jobID]);
        XCTAssertEqual([jobApplicationsArray count], 2, @"Should be True");
//    }
}

-(void)resetJAAndJSModel{
    [[JAModel sharedInstance]reset];
    [[JSModel sharedInstance]reset];
}
@end

