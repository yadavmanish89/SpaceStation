//
//  APIRequest.h
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    location = 0
} RequestType;

@interface APIRequest : NSObject
@property (nonatomic, strong) NSString *url;
-(id)initWithType:(RequestType) type;
@end

NS_ASSUME_NONNULL_END
