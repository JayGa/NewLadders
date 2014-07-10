//
//  JobDisplayName.m
//  NewLadders
//
//  Created by Jay Gaonkar on 7/9/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "JobDisplayName.h"

@implementation JobDisplayName


-(JobDisplayName*)initWithJob:(NSString *)jobName andPoster:(UserDisplayName *)postersName{
    self = [super init];
    gdisplayName = [NSString stringWithFormat:@"%@-%@", jobName, [postersName getUserDisplayNameString]];
    return self;
}

-(NSString*)getJobDisplayNameString{
    return gdisplayName;
}
@end