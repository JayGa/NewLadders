//
//  CSVReportStringGenerator.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IReportStringGenerator.h"
#import "IDentifer.h"

@interface CSVReportStringGenerator : NSObject <IReportStringGenerator>{
    NSString *gReportString;
}
-(id<IReportStringGenerator>)initWithString:(NSString*)aString;

//- (NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString;
- (NSString*)appendJobApplicationReportWithJobID:(IDentifer*)jobID andJobseekerID:(IDentifer*)jobseekerID;
@end
