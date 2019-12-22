//
//  NetworkManager.h
//  Launches
//
//  Created by Andrew Boissonnault on 12/21/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

#import <Foundation/Foundation.h>

@class URLBuilder;
@protocol URLSessionProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

-(id)initWithUrlBuilder:(URLBuilder*)urlBuilder urlSession:(id<URLSessionProtocol>)urlSession;

-(void)fetchLaunches:(void(^)(NSData *_Nullable data, NSError *_Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
