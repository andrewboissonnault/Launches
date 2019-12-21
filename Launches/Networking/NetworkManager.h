//
//  NetworkManager.h
//  Launches
//
//  Created by Andrew Boissonnault on 12/21/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

-(void)fetchLaunches:(void(^)(NSDictionary *result, NSError* error))completion;

@end

NS_ASSUME_NONNULL_END
