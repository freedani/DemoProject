//
//  ReplacingImageURLProtocol.m
//  NSURLProtocol+WebKitSupport
//
//  Created by yeatse on 2016/10/11.
//  Copyright © 2016年 Yeatse. All rights reserved.
//

#import "ReplacingImageURLProtocol.h"

#import <UIKit/UIKit.h>

static NSString* const FilteredKey = @"FilteredKey";

@implementation ReplacingImageURLProtocol

+ (BOOL)isImage:(NSString *)extension {
    return [@[@"png", @"jpeg", @"gif", @"jpg"] indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        return [extension compare:obj options:NSCaseInsensitiveSearch] == NSOrderedSame;
    }] != NSNotFound;
}

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    
    NSString *extension = request.URL.pathExtension;
    BOOL isImage = [self isImage:extension];
    if ([NSURLProtocol propertyForKey:FilteredKey inRequest:request] == nil && isImage) {
        NSLog(@"%@",request.URL.absoluteString);
        return true;
    }
    return false;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

- (void)startLoading {
    NSMutableURLRequest* request = self.request.mutableCopy;
    [NSURLProtocol setProperty:@YES forKey:FilteredKey inRequest:request];
    NSData* data = UIImagePNGRepresentation([UIImage imageNamed:@"placeholder"]);
    NSURLResponse* response = [[NSURLResponse alloc] initWithURL:self.request.URL MIMEType:@"image/png" expectedContentLength:data.length textEncodingName:nil];
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    [self.client URLProtocol:self didLoadData:data];
    [self.client URLProtocolDidFinishLoading:self];
}

- (void)stopLoading {
    
}

@end
