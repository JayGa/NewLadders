//
//  IDentifer.m
//  NewLadders
//
//  Created by Jay Gaonkar on 6/13/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import "IDentifer.h"

@implementation IDentifer


-(IDentifer*)initWithInteger:(int)identifier{
 
    self = [super init];
    self.gIdentifier = identifier;
    return self;
}

- (IDentifer*)copyWithZone:(NSZone *)zone
{
    IDentifer *iDentifier = [[[self class] allocWithZone:zone] init];

    if (iDentifier) {
        iDentifier.gIdentifier = self.gIdentifier;
    }
    return iDentifier;
}

-(void)printID{
    NSLog(@"PRINTING ID:%unsigned", self.gIdentifier);
}

- (BOOL)isEqual:(id)anObject {
    if (![anObject isKindOfClass:[IDentifer class]]) return NO;
    IDentifer *identifier = (IDentifer *)anObject;
//    NSInteger int1 = [self.gIdentifier integerValue];
//    NSInteger int2 = [identifier.gIdentifier integerValue];
    if(self.gIdentifier==identifier.gIdentifier)
        return true;
    else
        return false;
}
- (NSUInteger)hash{
    
    return self.gIdentifier;
}
@end
