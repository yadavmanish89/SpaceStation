//
//  NetworkManager.h
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

#import <Foundation/Foundation.h>
#import "APIRequest.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^LocationResponse)(NSError*, id);
@interface NetworkManager : NSObject
-(void)request:(APIRequest *) request completion:(void(^)(NSData*)) completion;
@end

NS_ASSUME_NONNULL_END
