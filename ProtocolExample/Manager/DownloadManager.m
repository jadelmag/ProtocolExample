//
//  DownloadManager.m
//  ProtocolExample
//
//  Created by Javier Delgado on 12/08/13.
//  Copyright (c) 2013 Javier Delgado. All rights reserved.
//

#import "DownloadManager.h"

@implementation DownloadManager

- (id)initWithURLString:(NSString *)url
{
    if (self = [super init]) {
        downloadedData = [[NSMutableData alloc] init];
        urlString = url;
    }
    return self;
}

- (void)startConnection
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDataDelegate method

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [downloadedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
{
    [downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.delegate downloadDidFinish:downloadedData];
}

#pragma mark - NSURLConnectionDelegate method

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Failed to download image at url %@", urlString);
}

@end
