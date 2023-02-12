//
//  NetworkManager.m
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

#import "NetworkManager.h"

@implementation NetworkManager

//- (void)request:(APIRequest *)request su:(LocationResponse) completion {

-(void)request: (APIRequest *) request
       success: (LocationSuccessResponse) successCompletion
         error: (LocationErrorResponse) errorCompletion {
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    [urlRequest setURL: [NSURL URLWithString: request.url]];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error)
        {
            if (errorCompletion)
                errorCompletion(error);
        }
        else
        {
            NSError *errorJSONParse;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&errorJSONParse];
            NSLog(@"*****%@****",json);
            if (successCompletion)
                successCompletion(data);
        }
    }];
    [dataTask resume];
}

@end
