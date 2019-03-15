# AniApiCall
Method to call Api. Method is in Closure Format it help to handle Api Response. It can handle Rest API an Soap.

In  AniApiCall Reachability Class is there. Before proceding set 
-fno-objc-arc 
in Reachablity.h file within Target > Build Phases > Compile Sources.

Method calling Example.

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


