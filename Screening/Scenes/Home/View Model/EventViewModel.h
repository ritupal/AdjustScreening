//
//  EventViewModel.h
//  Screening
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import <Foundation/Foundation.h>
#import "Event.h"

NS_ASSUME_NONNULL_BEGIN

@interface EventViewModel : NSObject
- (void)postEvent:(NSString *)second WithSuccess:(void (^)(Event * _Nonnull))successCompletion error:(void (^)(NSError * _Nonnull))errorCompletion;

- (NSString *)getCurrentSeconds;
@end

NS_ASSUME_NONNULL_END
