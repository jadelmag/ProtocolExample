//
//  ViewController.h
//  ProtocolExample
//
//  Created by Javier Delgado on 12/08/13.
//  Copyright (c) 2013 Javier Delgado. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadManager.h"

@interface ViewController : UIViewController <DownloadEnded> {
    NSArray *array1;
    NSArray *array2;
    NSArray *array3;
    NSArray *array4;
    NSArray *array5;
    NSArray *array6;
    NSArray *arrayImages;
    int numImages;
}

@end
