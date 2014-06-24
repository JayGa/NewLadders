//
//  MutableArrayWrap.h
//  NewLadders
//
//  Created by Jay Gaonkar on 6/23/14.
//  Copyright (c) 2014 Jay Gaonkar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MutableArrayWrap : NSObject{
 
    NSMutableArray *maWrap;
}

- (void)addObject:(id)anObject;
- (NSUInteger)count;
@end
