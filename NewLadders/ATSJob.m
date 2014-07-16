//
//  ATSJob.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/13/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "ATSJob.h"

@implementation ATSJob{
    NSString *gReportString;
}



-(id<IJob>)initWithIDName:(JobIDName*)jobIDName AndMetaData:(JobMetaData*)jobMetaData{
    self = [super init];
    gjobIDName = jobIDName;
    gjobMetaData = jobMetaData;
    return self;
}

-(NSString*)appendJobDisplayName{
    
    return [gjobIDName appendJobDisplayName];
}

-(void)callToAppendJobToJobApplicationReport:(JobApplicationCoreFields*)jobApplicationCoreFields{
    [gjobIDName callToAppendJobToJobApplicationReport:self];
    [jobApplicationCoreFields appendToReportString:gReportString];
}

-(void)appendToReportString:(NSString*)reportSubString{
//    if(gReportString==nil){
        gReportString = @"";
//    }
    gReportString = [gReportString stringByAppendingString:reportSubString];
}
@end