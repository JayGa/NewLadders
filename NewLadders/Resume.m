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
    self.gresumeID = resumeID;
    return self;
}

- (NSComparisonResult)compare:(Resume *)otherResume {
    
    return [self.gresumeID isEqual:otherResume.gresumeID];
}

- (BOOL)isEqual:(id)anObject {
    if (![anObject isKindOfClass:[Resume class]]) return NO;
    Resume *resume = (Resume *)anObject;
    int int1 = self.gresumeID.gIdentifier;
    int int2 = resume.gresumeID.gIdentifier;
    if(int1==int2)
        return true;
    else
        return false;
}

@end
