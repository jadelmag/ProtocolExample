//
//  DownloadManager.h
//  ProtocolExample
//
//  Created by Javier Delgado on 12/08/13.
//  Copyright (c) 2013 Javier Delgado. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DownloadEnded <NSObject>
-(void)downloadDidFinish:(NSData *)data;
@end

@interface DownloadManager : NSObject <NSURLConnectionDataDelegate, NSURLConnectionDelegate> {
    NSMutableData *downloadedData;
    NSString *urlString;
}

@property (weak) id<DownloadEnded> delegate;

- (id)initWithURLString:(NSString *)url;
- (void)startConnection;

@end