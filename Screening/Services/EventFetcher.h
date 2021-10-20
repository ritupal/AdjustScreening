//
//  EventFetcher.h
//  Screening
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import <Foundation/Foundation.h>
#import "EventFetcherProtocol.h"
#import "NetworkServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface EventFetcher : NSObject<EventFetcherProtocol>

- (instancetype)initWithClient:(nonnull id<NetworkServiceProtocol>)client parser:(id<EventParserProtocol>)parser;

@end

NS_ASSUME_NONNULL_END
