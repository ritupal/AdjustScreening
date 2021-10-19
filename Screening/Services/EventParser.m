//
//  EventParser.m
//  Screening
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import "EventParser.h"

@implementation EventParser

- (void)parseEvents:(NSData *)data withSuccess:(void (^)(Event *event))successCompletion error:(void (^)(NSError *error))errorCompletion {
    NSError *error;
    NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsonDictionary || error) {
        errorCompletion(error);
        return;
    }
    Event *event = [[Event alloc] init];
    if ([jsonDictionary objectForKey:@"id"] && [jsonDictionary objectForKey:@"seconds"]) {
        event.eventId = [jsonDictionary objectForKey:@"id"];;
        event.seconds = [jsonDictionary objectForKey:@"seconds"];
    }
    
    successCompletion(event);
}

@end
