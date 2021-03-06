//
//  SPRequest.m
//  Spectttator
//
//  Created by David Keegan on 6/25/11.
//  Copyright 2011 David Keegan.
//

#import "SPRequest.h"
#import "SPMethods.h"

@implementation SPRequest

#pragma mark Players
#pragma mark -

+ (void)playerInformationForUsername:(NSString *)username 
                     runOnMainThread:(BOOL)runOnMainThread 
                           withBlock:(void (^)(SPPlayer *))block{
    NSString *urlString = [NSString stringWithFormat:@"http://api.dribbble.com/players/%@", username];
    [[SPMethods operationQueue] addOperation:[NSBlockOperation blockOperationWithBlock:^{
        NSDictionary *json = [SPMethods jsonDataFromUrl:[NSURL URLWithString:urlString]];
        if(runOnMainThread){
            dispatch_async(dispatch_get_main_queue(), ^{
                block([[[SPPlayer alloc] initWithDictionary:json] autorelease]);
            });
        }else{
            block([[[SPPlayer alloc] initWithDictionary:json] autorelease]);
        }        
    }]];
}

+ (void)playerFollowers:(NSString *)username 
         withPagination:(NSDictionary *)pagination
        runOnMainThread:(BOOL)runOnMainThread 
              withBlock:(void (^)(NSArray *, SPPagination *))block{
    NSString *urlString = [NSString stringWithFormat:
                           @"http://api.dribbble.com/players/%@/followers%@", 
                           username, [SPMethods pagination:pagination]];
    [SPMethods requestPlayersWithURL:[NSURL URLWithString:urlString] 
                runOnMainThread:runOnMainThread 
                      withBlock:block];
}

+ (void)playerFollowing:(NSString *)username 
         withPagination:(NSDictionary *)pagination
        runOnMainThread:(BOOL)runOnMainThread
              withBlock:(void (^)(NSArray *, SPPagination *))block{
    NSString *urlString = [NSString stringWithFormat:
                           @"http://api.dribbble.com/players/%@/following%@", 
                           username, [SPMethods pagination:pagination]];
    [SPMethods requestPlayersWithURL:[NSURL URLWithString:urlString] 
                runOnMainThread:runOnMainThread 
                      withBlock:block];    
}

+ (void)playerDraftees:(NSString *)username 
        withPagination:(NSDictionary *)pagination
       runOnMainThread:(BOOL)runOnMainThread 
             withBlock:(void (^)(NSArray *, SPPagination *))block{
    NSString *urlString = [NSString stringWithFormat:
                           @"http://api.dribbble.com/players/%@/draftees%@", 
                           username, [SPMethods pagination:pagination]];
    [SPMethods requestPlayersWithURL:[NSURL URLWithString:urlString] 
                runOnMainThread:runOnMainThread 
                      withBlock:block];
}

#pragma mark Shots
#pragma mark -

+ (void)shotInformationForIdentifier:(NSUInteger)identifier 
                     runOnMainThread:(BOOL)runOnMainThread 
                           withBlock:(void (^)(SPShot *))block{
    NSString *urlString = [NSString stringWithFormat:@"http://api.dribbble.com/shots/%lu", identifier];
    [[SPMethods operationQueue] addOperation:[NSBlockOperation blockOperationWithBlock:^{
        NSDictionary *json = [SPMethods jsonDataFromUrl:[NSURL URLWithString:urlString]];
        if(runOnMainThread){
            dispatch_async(dispatch_get_main_queue(), ^{
                block([[[SPShot alloc] initWithDictionary:json] autorelease]);
            });
        }else{
            block([[[SPShot alloc] initWithDictionary:json] autorelease]);
        }
    }]];     
}

+ (void)shotsForList:(NSString *)list 
      withPagination:(NSDictionary *)pagination
     runOnMainThread:(BOOL)runOnMainThread 
           withBlock:(void (^)(NSArray *, SPPagination *))block{
    NSString *urlString = [NSString stringWithFormat:
                           @"http://api.dribbble.com/shots/%@%@", 
                           list, [SPMethods pagination:pagination]];
    [SPMethods requestShotsWithURL:[NSURL URLWithString:urlString] 
                runOnMainThread:runOnMainThread 
                      withBlock:block];  
}

+ (void)shotsForPlayer:(NSString *)username 
        withPagination:(NSDictionary *)pagination
       runOnMainThread:(BOOL)runOnMainThread 
             withBlock:(void (^)(NSArray *, SPPagination *))block{
    NSString *urlString = [NSString stringWithFormat:
                           @"http://api.dribbble.com/players/%@/shots%@", 
                           username, [SPMethods pagination:pagination]];
    [SPMethods requestShotsWithURL:[NSURL URLWithString:urlString] 
              runOnMainThread:runOnMainThread 
                    withBlock:block];
}

+ (void)shotsForPlayerFollowing:(NSString *)username 
                 withPagination:(NSDictionary *)pagination
                runOnMainThread:(BOOL)runOnMainThread
                      withBlock:(void (^)(NSArray *, SPPagination *))block{
    NSString *urlString = [NSString stringWithFormat:
                           @"http://api.dribbble.com/players/%@/shots/following%@", 
                           username, [SPMethods pagination:pagination]];
    [SPMethods requestShotsWithURL:[NSURL URLWithString:urlString] 
              runOnMainThread:runOnMainThread 
                    withBlock:block];
}

+ (void)shotsForPlayerLikes:(NSString *)username 
             withPagination:(NSDictionary *)pagination
            runOnMainThread:(BOOL)runOnMainThread
                  withBlock:(void (^)(NSArray *, SPPagination *))block{
    NSString *urlString = [NSString stringWithFormat:
                           @"http://api.dribbble.com/players/%@/shots/likes%@", 
                           username, [SPMethods pagination:pagination]];
    [SPMethods requestShotsWithURL:[NSURL URLWithString:urlString] 
              runOnMainThread:runOnMainThread 
                    withBlock:block];   
}

@end
