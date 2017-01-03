//
//  ViewController.m
//  fopenCC
//
//  Created by XingLongZhao on 2016/10/19.
//  Copyright © 2016年 XingLongZhao. All rights reserved.
//

#import "ViewController.h"
FILE *fp;
NSData *dt;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    NSLog(@"Xcode 8.1 beta 真是个坑~");
    //[self tryToTest];
    [self tryForMM];
//    [self tryToNSData];
}


- (void)tryToTest {
    
    fp = fopen("/Users/xinglongzhao/Desktop/Mac_test/t5.mm", "w+");
    NSString *wo = @"123456";
    NSMutableArray *array = [NSMutableArray array];
    fwrite([wo UTF8String], 100, 10, fp);
    rewind(fp);
    NSLog(@"array = %@,%d",array,__LINE__);
    //fread((__bridge void *)(array), 100, 10, fp);
    //[array writeToFile:(__bridge NSString * _Nonnull)(fp) atomically:YES];
    NSLog(@"array = %@,%d",array,__LINE__);
    NSLog(@"wo = %@",wo);
    fclose(fp);
    
}
- (void)ocToWriteFile {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] ;
    NSString *filePath = [path stringByAppendingPathComponent:@"c++.txt"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSData *data = [NSData dataWithContentsOfFile:filePath]; // 读
    [data writeToFile:filePath atomically:YES];//写
}
- (void)tryForMM {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] ;
    NSString *filePath = [path stringByAppendingPathComponent:@"c++.txt"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSLog(@"test_filePath = %@", filePath);
    fp = fopen([filePath UTF8String], "w+");
    NSString *wo = @"123456";
    NSArray *array = [NSArray arrayWithObject:@"123"];
    fwrite([wo UTF8String], 100, 10, fp);
//    rewind(fp);
    NSLog(@"array = %@,%d",array,__LINE__);
//    fread((__bridge void *)(array), 100, 10, fp);
//        [array writeToFile:(__bridge NSString * _Nonnull)(fp) atomically:YES];
    NSLog(@"array = %@,%d",array,__LINE__);
    NSLog(@"wo = %@",wo);
    fclose(fp);
    //只能这样，写入真机
}

- (void)tryToNSData {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] ;
    NSString *filePath = [path stringByAppendingPathComponent:@"c++.txt"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSLog(@"filePath = %@",filePath);
    char mystr[255];
    memset(&mystr, 0, 255);
    NSData *dt = [NSData dataWithBytes:mystr length:255];
    [dt writeToFile:filePath atomically:YES];
    NSLog(@"这样 可行吗");
    NSLog(@"dt = %@",dt);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
