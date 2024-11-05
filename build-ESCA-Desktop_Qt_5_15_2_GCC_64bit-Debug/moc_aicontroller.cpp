/****************************************************************************
** Meta object code from reading C++ file 'aicontroller.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/aiprocess/aicontroller.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'aicontroller.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_AIController_t {
    QByteArrayData data[18];
    char stringdata0[250];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AIController_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AIController_t qt_meta_stringdata_AIController = {
    {
QT_MOC_LITERAL(0, 0, 12), // "AIController"
QT_MOC_LITERAL(1, 13, 23), // "detectionResultReceived"
QT_MOC_LITERAL(2, 37, 0), // ""
QT_MOC_LITERAL(3, 38, 6), // "result"
QT_MOC_LITERAL(4, 45, 13), // "errorOccurred"
QT_MOC_LITERAL(5, 59, 5), // "error"
QT_MOC_LITERAL(6, 65, 16), // "isRunningChanged"
QT_MOC_LITERAL(7, 82, 22), // "inferenceResultChanged"
QT_MOC_LITERAL(8, 105, 17), // "errMessageChanged"
QT_MOC_LITERAL(9, 123, 17), // "onDetectionResult"
QT_MOC_LITERAL(10, 141, 14), // "onProcessError"
QT_MOC_LITERAL(11, 156, 14), // "startAIProcess"
QT_MOC_LITERAL(12, 171, 13), // "stopAIProcess"
QT_MOC_LITERAL(13, 185, 17), // "initiateDetection"
QT_MOC_LITERAL(14, 203, 9), // "parameter"
QT_MOC_LITERAL(15, 213, 9), // "isRunning"
QT_MOC_LITERAL(16, 223, 15), // "inferenceResult"
QT_MOC_LITERAL(17, 239, 10) // "errMessage"

    },
    "AIController\0detectionResultReceived\0"
    "\0result\0errorOccurred\0error\0"
    "isRunningChanged\0inferenceResultChanged\0"
    "errMessageChanged\0onDetectionResult\0"
    "onProcessError\0startAIProcess\0"
    "stopAIProcess\0initiateDetection\0"
    "parameter\0isRunning\0inferenceResult\0"
    "errMessage"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AIController[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       3,   84, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   64,    2, 0x06 /* Public */,
       4,    1,   67,    2, 0x06 /* Public */,
       6,    0,   70,    2, 0x06 /* Public */,
       7,    0,   71,    2, 0x06 /* Public */,
       8,    0,   72,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       9,    1,   73,    2, 0x08 /* Private */,
      10,    1,   76,    2, 0x08 /* Private */,

 // methods: name, argc, parameters, tag, flags
      11,    0,   79,    2, 0x02 /* Public */,
      12,    0,   80,    2, 0x02 /* Public */,
      13,    1,   81,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,    5,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QByteArray,    3,
    QMetaType::Void, QMetaType::QString,    5,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   14,

 // properties: name, type, flags
      15, QMetaType::Bool, 0x00495903,
      16, QMetaType::QString, 0x00495903,
      17, QMetaType::QString, 0x00495903,

 // properties: notify_signal_id
       2,
       3,
       4,

       0        // eod
};

void AIController::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AIController *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->detectionResultReceived((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->errorOccurred((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->isRunningChanged(); break;
        case 3: _t->inferenceResultChanged(); break;
        case 4: _t->errMessageChanged(); break;
        case 5: _t->onDetectionResult((*reinterpret_cast< const QByteArray(*)>(_a[1]))); break;
        case 6: _t->onProcessError((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 7: _t->startAIProcess(); break;
        case 8: _t->stopAIProcess(); break;
        case 9: _t->initiateDetection((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (AIController::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AIController::detectionResultReceived)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (AIController::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AIController::errorOccurred)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (AIController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AIController::isRunningChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (AIController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AIController::inferenceResultChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (AIController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AIController::errMessageChanged)) {
                *result = 4;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<AIController *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = _t->isRunning(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->inferenceResult(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->errMessage(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<AIController *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setIsRunning(*reinterpret_cast< bool*>(_v)); break;
        case 1: _t->setInferenceResult(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setErrMessage(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject AIController::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_AIController.data,
    qt_meta_data_AIController,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *AIController::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AIController::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AIController.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int AIController::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 10)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 10;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void AIController::detectionResultReceived(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void AIController::errorOccurred(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void AIController::isRunningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void AIController::inferenceResultChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void AIController::errMessageChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
