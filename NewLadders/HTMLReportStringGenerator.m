//
//  HTMLReportStringGenerator.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/27/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "HTMLReportStringGenerator.h"

@implementation HTMLReportStringGenerator

-(NSString*)appendJobApplicationReportRecordTo:(NSString*)reportString{

    return [NSString stringWithFormat:@"%@<tr><td>%@</td><td>%@</td></tr>",reportString, jobID, jobseekerID];
}
@end
