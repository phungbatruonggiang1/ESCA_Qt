/****************************************************************************
** Meta object code from reading C++ file 'process.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/common/process/process.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'process.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Process_t {
    QByteArrayData data[18];
    char stringdata0[222];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Process_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Process_t qt_meta_stringdata_Process = {
    {
QT_MOC_LITERAL(0, 0, 7), // "Process"
QT_MOC_LITERAL(1, 8, 5), // "start"
QT_MOC_LITERAL(2, 14, 0), // ""
QT_MOC_LITERAL(3, 15, 4), // "stop"
QT_MOC_LITERAL(4, 20, 12), // "errorOccured"
QT_MOC_LITERAL(5, 33, 22), // "QProcess::ProcessError"
QT_MOC_LITERAL(6, 56, 5), // "error"
QT_MOC_LITERAL(7, 62, 8), // "finished"
QT_MOC_LITERAL(8, 71, 8), // "exitCode"
QT_MOC_LITERAL(9, 80, 20), // "QProcess::ExitStatus"
QT_MOC_LITERAL(10, 101, 10), // "exitStatus"
QT_MOC_LITERAL(11, 112, 22), // "readyReadStandardError"
QT_MOC_LITERAL(12, 135, 23), // "readyReadStandardOutput"
QT_MOC_LITERAL(13, 159, 7), // "started"
QT_MOC_LITERAL(14, 167, 12), // "stateChanged"
QT_MOC_LITERAL(15, 180, 22), // "QProcess::ProcessState"
QT_MOC_LITERAL(16, 203, 8), // "newState"
QT_MOC_LITERAL(17, 212, 9) // "readyRead"

    },
    "Process\0start\0\0stop\0errorOccured\0"
    "QProcess::ProcessError\0error\0finished\0"
    "exitCode\0QProcess::ExitStatus\0exitStatus\0"
    "readyReadStandardError\0readyReadStandardOutput\0"
    "started\0stateChanged\0QProcess::ProcessState\0"
    "newState\0readyRead"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Process[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x0a /* Public */,
       3,    0,   60,    2, 0x0a /* Public */,
       4,    1,   61,    2, 0x08 /* Private */,
       7,    2,   64,    2, 0x08 /* Private */,
      11,    0,   69,    2, 0x08 /* Private */,
      12,    0,   70,    2, 0x08 /* Private */,
      13,    0,   71,    2, 0x08 /* Private */,
      14,    1,   72,    2, 0x08 /* Private */,
      17,    0,   75,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 5,    6,
    QMetaType::Void, QMetaType::Int, 0x80000000 | 9,    8,   10,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 15,   16,
    QMetaType::Void,

       0        // eod
};

void Process::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Process *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->start(); break;
        case 1: _t->stop(); break;
        case 2: _t->errorOccured((*reinterpret_cast< QProcess::ProcessError(*)>(_a[1]))); break;
        case 3: _t->finished((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QProcess::ExitStatus(*)>(_a[2]))); break;
        case 4: _t->readyReadStandardError(); break;
        case 5: _t->readyReadStandardOutput(); break;
        case 6: _t->started(); break;
        case 7: _t->stateChanged((*reinterpret_cast< QProcess::ProcessState(*)>(_a[1]))); break;
        case 8: _t->readyRead(); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject Process::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Process.data,
    qt_meta_data_Process,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Process::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Process::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Process.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Process::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
