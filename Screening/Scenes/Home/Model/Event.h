//
//  Event.h
//  Screening
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Event : NSObject
@property (nonatomic, assign) NSString * eventId;
@property (nonatomic, strong) NSString * seconds;

- (instancetype)initWithId:(NSString *)eventId seconds:(NSString*)seconds;

@end

NS_ASSUME_NONNULL_END
