//
//  EventFetcherProtocol.h
//  Screening
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import <Foundation/Foundation.h>

#ifndef EventFetcherProtocol_h
#define EventFetcherProtocol_h

#import "Event.h"

@protocol EventFetcherProtocol <NSObject>

- (void)postEvent:(NSString *)seconds WithSuccess:(void (^)(Event *event))successCompletion error:(void (^)(NSError *error))errorCompletion;


@end

@protocol EventParserProtocol <NSObject>

- (void)parseEvents:(NSData *)data withSuccess:(void (^)(Event *event))successCompletion error:(void (^)(NSError *error))errorCompletion;

@end

#endif /* EventFetcherProtocol_h */
