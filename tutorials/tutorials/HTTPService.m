//
//  HTTPService.m
//  tutorials
//
//  Created by Leonidas on 14/10/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService: NSObject

+ (id) instance {
    
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
    
}



@end
