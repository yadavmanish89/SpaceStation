//
//  NetworkManager.h
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

#import <Foundation/Foundation.h>
#import "APIRequest.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^LocationSuccessResponse)(NSData*);
typedef void (^LocationErrorResponse)(NSError*);
@interface NetworkManager : NSObject
-(void)request: (APIRequest *) request
       success: (LocationSuccessResponse) successCompletion
         error: (LocationErrorResponse) errorCompletion;
@end

NS_ASSUME_NONNULL_END
