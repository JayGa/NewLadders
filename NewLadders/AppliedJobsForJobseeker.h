//
//  AppliedJobsForJobseeker.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/24/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppliedJobsForJobseeker : NSObject{
    
    NSMutableDictionary *aDictionary;
}
- (id)objectForKey:(id)aKey;
- (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey;
- (void)setValue:(id)value forKey:(NSString *)key;

@end
