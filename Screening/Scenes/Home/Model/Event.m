//
//  Event.m
//  Screening
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import "Event.h"

@implementation Event
- (instancetype)initWithId:(NSInteger)eventId seconds:(NSString*)seconds
{
    self = [super init];
    if (self) {
        self.eventId = eventId;
        self.seconds = seconds;
    }
    return self;
}
@end
