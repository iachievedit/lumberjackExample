//
//  AppDelegate.m
//  lumberjackExample
//
//  Created by Joseph Bell on 2/10/13.
//  Copyright (c) 2013 iAchieved.it LLC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate()

@property (nonatomic, strong) DDFileLogger* fileLogger;

@end

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [DDLog addLogger:[DDTTYLogger sharedInstance]];
  self.fileLogger = [[DDFileLogger alloc] init];
  self.fileLogger.rollingFrequency =  60 * 60 * 24; // 1 hour rolling
  self.fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
  self.fileLogger.maximumFileSize = 384 * 1024; // 384K
  [self.fileLogger setLogFormatter:[[DDLogFileFormatterDefault alloc]init]];
  [DDLog addLogger:self.fileLogger];
  
  DDLogVerbose(@"Starting up application...");
  
  // Perform some actions
  for (int i = 1; i < 5; i++) {
    DDLogInfo(@"Performing startup action %d", i);
  }
  
  DDLogVerbose(@"Startup actions complete");
  
  return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  ENTRY_LOG;
  EXIT_LOG;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
