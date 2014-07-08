//
//  IDentifer.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/13/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "IDentifer.h"

@implementation IDentifer


-(IDentifer*)initWithString:(NSString *)identifier{
 
    self = [super init];
    gIdentifier = identifier;
    return self;
}

- (IDentifer*)copyWithZone:(NSZone *)zone
{
    IDentifer *iDentifier = [[[self class] allocWithZone:zone] init];

    if (iDentifier) {
        iDentifier->gIdentifier = gIdentifier;
    }
    return iDentifier;
}

-(void)printID{
    NSLog(@"PRINTING ID:%@", gIdentifier);
}

- (BOOL)isEqual:(id)anObject {
    if (![anObject isKindOfClass:[IDentifer class]]) return NO;
    IDentifer *identifier = (IDentifer *)anObject;
    BOOL returnValue = ([gIdentifier isEqualToString: identifier->gIdentifier]);
    return returnValue;
}
- (NSUInteger)hash{
    
    return [gIdentifier hash];
}
@end
