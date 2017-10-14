//
//  HTTPService.m
//  tutorials
//
//  Created by Leonidas on 14/10/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:6069" //express server running
#define URL_TUTORIALS "/tutorials"

@implementation HTTPService: NSObject

+ (id) instance {
    
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
    
}

- (void) getTutorials:(nullable onComplete)completionHandler {
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil){
            
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                
                completionHandler(json,nil);
                
            } else {
                
                completionHandler(nil, @"Data is corrupt. Please try again");
            }
            
        } else {
            
            NSLog(@"Network Err %@", error.debugDescription);
            completionHandler(nil, @"problem connecting to the server");
        }
        
        
    }] resume];
}

@end
