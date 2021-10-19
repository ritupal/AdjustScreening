//
//  NetworkServiceProtocol.h
//  ObjectiveCSample
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import <Foundation/Foundation.h>

#ifndef NetworkServiceProtocol_h
#define NetworkServiceProtocol_h

@protocol NetworkServiceProtocol <NSObject>

- (void)postEventWithUrl:(NSURL *)url withSeconds: (NSString *)seconds withSuccess:(void (^)(NSData *))successCompletion error:(void (^)(NSError *))errorCompletion;

@end


#endif /* NetworkServiceProtocol_h */
