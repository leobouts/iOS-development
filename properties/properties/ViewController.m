//
//  ViewController.m
//  properties
//
//  Created by Leonidas on 03/08/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person1 = [[Person alloc]init];
    person1.firstName = @"Sandra";
    [person1 setLastName:@"Mandra"];
    
    
}


@end
