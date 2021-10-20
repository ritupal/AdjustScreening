//
//  NetworkService.m
//  ObjectiveCSample
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import "NetworkService.h"

@interface NetworkService()

@property (nonatomic, strong) NSMutableDictionary * tasks;

@end

@implementation NetworkService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tasks = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)postEventWithUrl:(NSURL *)url withSeconds: (NSString *)seconds withSuccess:(void (^)(NSData *))successCompletion error:(void (^)(NSError *))errorCompletion {
    
    //semaphore for synchronous request
    dispatch_semaphore_t sem;
    NSURLSessionTask * previousTask = [self.tasks objectForKey:url.absoluteString];
    if (previousTask){
        [previousTask cancel];
    }
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
    NSString * postDataString = [NSString stringWithFormat:@"seconds=%@", seconds];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[postDataString dataUsingEncoding:NSUTF8StringEncoding]];
    //create semaphore
    sem = dispatch_semaphore_create(0);
    NSURLSessionTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //call semaphore
        dispatch_semaphore_signal(sem);
        
        if (error) {
            errorCompletion(error);
            return;
        }
        
        if (!data) {
            errorCompletion(nil);
            return;
        }
        
        successCompletion(data);
    }];
    
    [task resume];
    //resume synchronous from here
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    
    [self.tasks setObject:task forKey:url.absoluteString];
}

@end
