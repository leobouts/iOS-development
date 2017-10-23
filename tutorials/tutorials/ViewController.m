//
//  ViewController.m
//  tutorials
//
//  Created by Leonidas on 14/10/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong) NSArray *videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    
    self.videoList = [[NSArray alloc]init];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        
        if (dataArray) {
            
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            
            for (NSDictionary *d in dataArray){
                
                Video *vid = [[Video alloc]init];
                vid.videoTitle = [d objectForKey:@"title"];
                vid.videoDescription = [d objectForKey:@"description"];
                vid.thumbnailUrl = [d objectForKey:@"thumbnail"];
                vid.videoIframe = [d objectForKey:@"iframe"];

                [arr addObject:vid];
            }
            
            self.videoList = arr;
            [self updateTableData];
            
            
        } else if (errMessage) {
            
            //display alert
            
        }
    }];
    
}

-(void) updateTableData {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.tableview reloadData];
        
    });
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"main"];
    
    if(!cell){
        
        cell =[[VideoCell alloc]init];
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.videoList.count; //crashed if we didnt initialized the array
}

@end
