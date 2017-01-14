TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

DEFINES += QT_DEPRECATED_WARNINGS

ios {
    QMAKE_INFO_PLIST = ios/deploy/Info.plist

    QMAKE_IOS_DEPLOYMENT_TARGET = 9.0

    QMAKE_XCODE_PROVISIONING_PROFILE = # Put here provisioning profile id (looking like 12345678-90ab-cdef-1234-567890abcdef)

    Q_DEVELOPMENT_TEAM.name = DEVELOPMENT_TEAM
    Q_DEVELOPMENT_TEAM.value = # Put here yout development team id (looking like ABCDEF1234)
    QMAKE_MAC_XCODE_SETTINGS += Q_DEVELOPMENT_TEAM

    Q_PRODUCT_BUNDLE_IDENTIFIER.name = PRODUCT_BUNDLE_IDENTIFIER
    Q_PRODUCT_BUNDLE_IDENTIFIER.value = com.example.iosDelegate # Put here target app bundle id
    QMAKE_MAC_XCODE_SETTINGS += Q_PRODUCT_BUNDLE_IDENTIFIER

    OBJECTIVE_HEADERS += ios/source/QIOSApplicationDelegate+Example.h
    OBJECTIVE_SOURCES += ios/source/QIOSApplicationDelegate+Example.mm

    LIBS += -F$$PWD/ios/libs/CocoaPods/Pods/Crashlytics/iOS -framework Crashlytics
    LIBS += -F$$PWD/ios/libs/CocoaPods/Pods/Fabric/iOS -framework Fabric
}
