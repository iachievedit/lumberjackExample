//
//  Logging.h
//  lumberjackExample
//
//  Created by Joseph Bell on 2/10/13.
//  Copyright (c) 2013 iAchieved.it LLC. All rights reserved.
//

#ifndef lumberjackExample_Logging_h
#define lumberjackExample_Logging_h

#import "DDLog.h"

#define ENTRY_LOG      DDLogVerbose(@"%s ENTRY ", __PRETTY_FUNCTION__);
#define EXIT_LOG       DDLogVerbose(@"%s EXIT ", __PRETTY_FUNCTION__);
#define ERROR_EXIT_LOG DDLogError(@"%s ERROR EXIT", __PRETTY_FUNCTION__);

#endif
