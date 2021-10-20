//
//  EventViewModel.m
//  Screening
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import "EventViewModel.h"
#import <UIKit/UIKit.h>
#import "EventParser.h"
#import "EventFetcher.h"
#import "NetworkService.h"

@interface EventViewModel()

@property (nonatomic, strong) id<EventFetcherProtocol> fetcher;


@end

@implementation EventViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fetcher = [[EventFetcher alloc] initWithClient:[[NetworkService alloc] init] parser:[[EventParser alloc] init]];
    }
    return self;
}

- (void)postEvent:(NSString *)second WithSuccess:(void (^)(Event * _Nonnull))successCompletion error:(void (^)(NSError * _Nonnull))errorCompletion {
    
    __weak EventViewModel *weakSelf = self;
    [self.fetcher postEvent:second WithSuccess:^(Event *event) {
        successCompletion(event);
    } error:errorCompletion];
}

- (NSString *)getCurrentSeconds {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];

    NSDate *currentDate = [NSDate date];
    NSString *dateString = [formatter stringFromDate:currentDate];
    NSArray *dateItems = [dateString componentsSeparatedByString:@":"];
    return  dateItems[2];
}

@end
