//
//  AppDelegate.h
//  FlipBounced
//
//  Created by MJHee on 2017/4/1.
//  Copyright © 2017年 MJBaby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

