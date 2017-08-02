//
//  ViewController.m
//  HelloOBJ
//
//  Created by Leonidas on 02/08/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickbait:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome" message:@"Welcome to the world of objective c" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"CLOSE" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:closeAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
