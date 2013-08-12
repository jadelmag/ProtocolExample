//
//  ViewController.m
//  ProtocolExample
//
//  Created by Javier Delgado on 12/08/13.
//  Copyright (c) 2013 Javier Delgado. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self load];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)load
{
    NSLog(@"Loading info...");
    array1 = [NSArray arrayWithObjects:@"Blue Blocks",@"http://fc05.deviantart.net/fs70/i/2012/168/9/d/blue_blocks_wallpaper_1920_x_1200_by_ryanr08-d53vdxh.png", nil];
    array2 = [NSArray arrayWithObjects:@"Extruded blocks",@"http://fc00.deviantart.net/fs71/f/2011/029/3/6/extruded_blocks_wallpaper_by_spin86-d38bcxl.png", nil];
    array3 = [NSArray arrayWithObjects:@"3D Blocks",@"http://www.thewallpapers.org/photo/26105/3d-blocks.jpg", nil];
    array4 = [NSArray arrayWithObjects:@"Ubuntu Cubes",@"http://wallpapersus.com/wp-content/uploads/2012/05/3D-blocks-Linux-Ubuntu-cubes.jpg", nil];
    array5 = [NSArray arrayWithObjects:@"Dizzy Blocks",@"http://www.scenicreflections.com/files/Dizzy_Blocks_Wallpaper_uq2zg.jpg", nil];
    array6 = [NSArray arrayWithObjects:@"Green Blocks",@"http://m.flikie.com/ImageData/WallPapers/db0ccd211ee84e45863369aede8422d5.jpg", nil];
    
    arrayImages = [NSArray arrayWithObjects:array1,array2,array3,array4,array5,array6, nil];
    NSLog(@"Info Loaded!!");
    NSLog(@"Downloading Images!!");
    [self downloadImages];
}

- (void)downloadImages
{
    for (NSArray *array in arrayImages)
    {
        DownloadManager *downloaderManager = [[DownloadManager alloc] initWithURLString:[array objectAtIndex:1]];
        downloaderManager.delegate = self;
        [downloaderManager startConnection];
    }
}

- (void)downloadDidFinish:(NSData *)data
{
    NSLog(@"image %d downloaded", numImages);
    [self saveImageWithData:data];
}

- (void)saveImageWithData:(NSData *)data
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    path = [path stringByAppendingString:[NSString stringWithFormat:@"/image_0%d.jpg",numImages]];
    [data writeToFile:path atomically:YES];
    NSLog(@"image %d saved", numImages);
    
    numImages++;
    
    if ([self isLastImage])
        NSLog(@"All images downloaded!!");
}

- (BOOL)isLastImage
{
    if (numImages == 6) return YES;
    return NO;
}

@end
