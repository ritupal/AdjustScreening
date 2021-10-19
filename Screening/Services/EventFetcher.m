//
//  EventFetcher.m
//  Screening
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import "EventFetcher.h"
#import "Constants.h"

@interface EventFetcher()

@property (nonatomic, strong) id<EventParserProtocol> parser;
@property (nonatomic, strong) id<NetworkServiceProtocol> networkClient;

@end

@implementation EventFetcher

- (instancetype)initWithClient:(nonnull id<NetworkServiceProtocol>)client parser:(id<EventParserProtocol>)parser {
    self = [super init];
    if (self) {
        self.parser = parser;
        self.networkClient = client;
    }
    return self;
}

- (void)postEvent:(NSString *)seconds WithSuccess:(void (^)(Event *event))successCompletion error:(void (^)(NSError *error))errorCompletion {
    NSURL * url = [NSURL URLWithString: kBaseUrl];
    
    __weak EventFetcher * weakSelf = self;
    void (^networksResponse)(NSData *) = ^(NSData *data){
        [weakSelf.parser parseEvents:data withSuccess:successCompletion error:errorCompletion];
    };
    
    // TODO: improve error handling at each steps
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [weakSelf.networkClient postEventWithUrl:url withSeconds:seconds withSuccess:networksResponse error: errorCompletion];
    });
}

@end
