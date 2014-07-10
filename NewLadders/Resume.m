//
//  Resume.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/4/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "Resume.h"

@implementation Resume

-(Resume*)initWithID:(IDentifer*)resumeID{
    
    self = [super init];
    gresumeID = resumeID;
    return self;
}

- (NSComparisonResult)compare:(Resume *)otherResume {
    
    return [gresumeID isEqual:otherResume->gresumeID];
}

- (BOOL)isEqual:(id)anObject {
    if (![anObject isKindOfClass:[Resume class]]) return NO;
    Resume *resume = (Resume *)anObject;
    if([gresumeID isEqual:resume->gresumeID])
        return true;
    else
        return false;
}

@end
