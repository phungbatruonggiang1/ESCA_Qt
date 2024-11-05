/****************************************************************************
** Meta object code from reading C++ file 'audiomanipulation.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/audiomanipulation/audiomanipulation.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'audiomanipulation.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_AudioManipulation_t {
    QByteArrayData data[10];
    char stringdata0[109];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AudioManipulation_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AudioManipulation_t qt_meta_stringdata_AudioManipulation = {
    {
QT_MOC_LITERAL(0, 0, 17), // "AudioManipulation"
QT_MOC_LITERAL(1, 18, 11), // "extractMFCC"
QT_MOC_LITERAL(2, 30, 0), // ""
QT_MOC_LITERAL(3, 31, 9), // "audioPath"
QT_MOC_LITERAL(4, 41, 11), // "extractGFCC"
QT_MOC_LITERAL(5, 53, 16), // "extractFrequency"
QT_MOC_LITERAL(6, 70, 10), // "splitAudio"
QT_MOC_LITERAL(7, 81, 6), // "source"
QT_MOC_LITERAL(8, 88, 11), // "destination"
QT_MOC_LITERAL(9, 100, 8) // "duration"

    },
    "AudioManipulation\0extractMFCC\0\0audioPath\0"
    "extractGFCC\0extractFrequency\0splitAudio\0"
    "source\0destination\0duration"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AudioManipulation[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   34,    2, 0x02 /* Public */,
       4,    1,   37,    2, 0x02 /* Public */,
       5,    1,   40,    2, 0x02 /* Public */,
       6,    3,   43,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,    7,    8,    9,

       0        // eod
};

void AudioManipulation::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AudioManipulation *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->extractMFCC((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->extractGFCC((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->extractFrequency((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->splitAudio((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject AudioManipulation::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_AudioManipulation.data,
    qt_meta_data_AudioManipulation,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *AudioManipulation::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AudioManipulation::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AudioManipulation.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int AudioManipulation::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
