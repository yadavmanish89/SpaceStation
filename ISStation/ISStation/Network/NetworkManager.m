//
//  NetworkManager.m
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

#import "NetworkManager.h"

@implementation NetworkManager

- (void)request:(APIRequest *)request completion:(void (^)(NSData*))completion {

    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    [urlRequest setURL: [NSURL URLWithString: request.url]];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error)
        {
            if (completion)
                completion(nil);
        }
        else
        {
            NSError *errorJSONParse;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&errorJSONParse];
            NSLog(@"*****%@****",json);
            if (completion)
                completion(data);
        }
    }];
    [dataTask resume];
}

@end
