//
//  Person.m
//  properties
//
//  Created by Leonidas on 03/08/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import "Person.h"

@implementation Person


-(void)test {
    
    self.firstName = @"Bob";
    
    _firstName = @"Jack";
     
    isInsecure = YES;
    
    [self setLastName:@"Davis"];
    
    NSString *name = [self firstName];
    
    
    
}
@end
