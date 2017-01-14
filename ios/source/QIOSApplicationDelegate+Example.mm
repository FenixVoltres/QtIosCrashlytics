#import <UIKit/UIKit.h>

#import <Crashlytics/Crashlytics.h>
#import <Fabric/Fabric.h>

#import "QIOSApplicationDelegate+Example.h"

#include <QtGlobal>
#include <QDebug>

@implementation QIOSApplicationDelegate (Example)

- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    Q_UNUSED(application)
    Q_UNUSED(launchOptions)

    [self setupCrashlytics];

    return YES;
}

- (void) setupCrashlytics
{
    [Fabric with:@[[Crashlytics class]]];

    qDebug() << "Crashlytics initialized!";
}

@end
