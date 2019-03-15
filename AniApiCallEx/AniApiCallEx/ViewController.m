//
//  ViewController.m
//  AniApiCallEx
//
//  Created by Anish Kumar Mallik on 15/03/19.
//  Copyright © 2019 Anish Mallik. All rights reserved.
//

#import "ViewController.h"
#import "AniApiCall/AniApiMethod.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // post method
    
    NSMutableDictionary *dic =[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"morpheus",@"name",@"leader",@"job", nil];
    [[AniApiMethod sharedManager] callPOSTJSONMethod:[NSURL URLWithString:@"https://reqres.in/api/users"] parameter:dic completion:^(NSData *data, NSError *error) {
        NSError *jsonErro;
        if(data!=nil)
        {
            NSMutableDictionary *jsonAry=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonErro];
            NSLog(@"%@",jsonAry);
            
        }
    }];
    
    // GET method
    
    [[AniApiMethod sharedManager] callGETJSONMethodApi:[NSURL URLWithString:@"https://reqres.in/api/users?page=2"] completion:^(NSData *data, NSError *error) {
        NSError *jsonErro;
        if(data!=nil)
        {
            NSMutableDictionary *jsonAry=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonErro];
            NSLog(@"%@",jsonAry);
            
        }
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
