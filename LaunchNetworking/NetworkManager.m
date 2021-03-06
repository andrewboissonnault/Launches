//
//  NetworkManager.m
//  Launches
//
//  Created by Andrew Boissonnault on 12/21/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

#import "NetworkManager.h"
#import <LaunchNetworking/LaunchNetworking-Swift.h>

const NSUInteger NEXT_COUNT = 20;

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager()

@property (nonatomic) URLBuilder* urlBuilder;
@property (nonatomic) id<URLSessionProtocol> urlSession;

@end


@implementation NetworkManager

-(id)initWithUrlBuilder:(URLBuilder*)urlBuilder urlSession:(id<URLSessionProtocol>)urlSession {
    self = [super init];
    self.urlBuilder = urlBuilder;
    self.urlSession = urlSession;
    return self;
}

-(id)init {
    URLBuilder* builder = [[URLBuilder alloc] init];
    NSURLSession* session = NSURLSession.sharedSession;
    self = [self initWithUrlBuilder:builder urlSession:session];
    return self;
}

-(void)fetchLaunches:(void(^)(NSData *_Nullable data, NSError *_Nullable error))completion {
    NSURL* url = [self.urlBuilder launchUrlWithCount:NEXT_COUNT];
    id<URLSessionDataTaskProtocol> task = [self.urlSession dataTaskWith:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error != nil) {
            completion(nil, error);
            return;
        }
        if(data == nil) {
            NSError* error = [[NSError alloc] initWithDomain:LaunchNetworkingErrorDomain code:LaunchNetworkingErrorMissingData userInfo:nil];
            completion(nil, error);
            return;
        }
        completion(data, nil);
    }];
    [task resume];
}

@end

NS_ASSUME_NONNULL_END
