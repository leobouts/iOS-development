//
//  ViewController.m
//  ClassAnatomy
//
//  Created by Leonidas on 02/08/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) NSString *vehicle; //declare vars only accessible by the class
@end

@implementation ViewController //exact same name defined at the header file

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Name: %@", self.name);
    
    self.name = @"Jack";
    
    NSLog(@"Name: %@", self.name);
    
    _name = @"Peter";
    
    NSLog(@"Name: %@", _name);
    
    [self setName:@"Syl"];
    
    NSLog(@"Name: %@", [self name]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
