//
//  APIRequest.m
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

#import "APIRequest.h"
#import "APIConstants.h"
@implementation APIRequest

-(id)initWithType:(RequestType) type {
    self = [super init];
    switch (type) {
        case location:
            self.url = [NSString stringWithFormat:@"%@/%@",baseURL,locationAPI];
            break;
    }
    return self;
}

@end
