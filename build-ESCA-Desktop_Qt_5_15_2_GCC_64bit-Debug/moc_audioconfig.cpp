/****************************************************************************
** Meta object code from reading C++ file 'audioconfig.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/audiorecording/audioconfig.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'audioconfig.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_AudioConfig_t {
    QByteArrayData data[34];
    char stringdata0[457];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AudioConfig_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AudioConfig_t qt_meta_stringdata_AudioConfig = {
    {
QT_MOC_LITERAL(0, 0, 11), // "AudioConfig"
QT_MOC_LITERAL(1, 12, 17), // "listCodecsChanged"
QT_MOC_LITERAL(2, 30, 0), // ""
QT_MOC_LITERAL(3, 31, 21), // "listSampleRateChanged"
QT_MOC_LITERAL(4, 53, 18), // "listChannelChanged"
QT_MOC_LITERAL(5, 72, 18), // "listEndianzChanged"
QT_MOC_LITERAL(6, 91, 18), // "listDevicesChanged"
QT_MOC_LITERAL(7, 110, 21), // "listSampleSizeChanged"
QT_MOC_LITERAL(8, 132, 20), // "nearistParamsChanged"
QT_MOC_LITERAL(9, 153, 15), // "saveDoneChanged"
QT_MOC_LITERAL(10, 169, 19), // "listDurationChanged"
QT_MOC_LITERAL(11, 189, 17), // "listOutputChanged"
QT_MOC_LITERAL(12, 207, 12), // "changeDevice"
QT_MOC_LITERAL(13, 220, 3), // "idx"
QT_MOC_LITERAL(14, 224, 10), // "saveConfig"
QT_MOC_LITERAL(15, 235, 6), // "device"
QT_MOC_LITERAL(16, 242, 5), // "codec"
QT_MOC_LITERAL(17, 248, 10), // "sampleRate"
QT_MOC_LITERAL(18, 259, 7), // "channel"
QT_MOC_LITERAL(19, 267, 6), // "endian"
QT_MOC_LITERAL(20, 274, 10), // "sampleSize"
QT_MOC_LITERAL(21, 285, 8), // "duration"
QT_MOC_LITERAL(22, 294, 11), // "listDevices"
QT_MOC_LITERAL(23, 306, 14), // "listSampleRate"
QT_MOC_LITERAL(24, 321, 10), // "QList<int>"
QT_MOC_LITERAL(25, 332, 11), // "listChannel"
QT_MOC_LITERAL(26, 344, 10), // "listCodecs"
QT_MOC_LITERAL(27, 355, 11), // "listEndianz"
QT_MOC_LITERAL(28, 367, 27), // "QList<QAudioFormat::Endian>"
QT_MOC_LITERAL(29, 395, 14), // "listSampleSize"
QT_MOC_LITERAL(30, 410, 12), // "listDuration"
QT_MOC_LITERAL(31, 423, 10), // "listOutput"
QT_MOC_LITERAL(32, 434, 13), // "nearistParams"
QT_MOC_LITERAL(33, 448, 8) // "saveDone"

    },
    "AudioConfig\0listCodecsChanged\0\0"
    "listSampleRateChanged\0listChannelChanged\0"
    "listEndianzChanged\0listDevicesChanged\0"
    "listSampleSizeChanged\0nearistParamsChanged\0"
    "saveDoneChanged\0listDurationChanged\0"
    "listOutputChanged\0changeDevice\0idx\0"
    "saveConfig\0device\0codec\0sampleRate\0"
    "channel\0endian\0sampleSize\0duration\0"
    "listDevices\0listSampleRate\0QList<int>\0"
    "listChannel\0listCodecs\0listEndianz\0"
    "QList<QAudioFormat::Endian>\0listSampleSize\0"
    "listDuration\0listOutput\0nearistParams\0"
    "saveDone"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AudioConfig[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
      10,  102, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      10,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   74,    2, 0x06 /* Public */,
       3,    0,   75,    2, 0x06 /* Public */,
       4,    0,   76,    2, 0x06 /* Public */,
       5,    0,   77,    2, 0x06 /* Public */,
       6,    0,   78,    2, 0x06 /* Public */,
       7,    0,   79,    2, 0x06 /* Public */,
       8,    0,   80,    2, 0x06 /* Public */,
       9,    0,   81,    2, 0x06 /* Public */,
      10,    0,   82,    2, 0x06 /* Public */,
      11,    0,   83,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
      12,    1,   84,    2, 0x02 /* Public */,
      14,    7,   87,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Int,   13,
    QMetaType::Void, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int,   15,   16,   17,   18,   19,   20,   21,

 // properties: name, type, flags
      22, QMetaType::QStringList, 0x00495903,
      23, 0x80000000 | 24, 0x0049590b,
      25, 0x80000000 | 24, 0x0049590b,
      26, QMetaType::QStringList, 0x00495903,
      27, 0x80000000 | 28, 0x0049590b,
      29, 0x80000000 | 24, 0x0049590b,
      30, QMetaType::QStringList, 0x00495801,
      31, QMetaType::QStringList, 0x00495903,
      32, 0x80000000 | 24, 0x00495809,
      33, QMetaType::Bool, 0x00495903,

 // properties: notify_signal_id
       4,
       1,
       2,
       0,
       3,
       5,
       8,
       9,
       6,
       7,

       0        // eod
};

void AudioConfig::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AudioConfig *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->listCodecsChanged(); break;
        case 1: _t->listSampleRateChanged(); break;
        case 2: _t->listChannelChanged(); break;
        case 3: _t->listEndianzChanged(); break;
        case 4: _t->listDevicesChanged(); break;
        case 5: _t->listSampleSizeChanged(); break;
        case 6: _t->nearistParamsChanged(); break;
        case 7: _t->saveDoneChanged(); break;
        case 8: _t->listDurationChanged(); break;
        case 9: _t->listOutputChanged(); break;
        case 10: _t->changeDevice((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 11: _t->saveConfig((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5])),(*reinterpret_cast< int(*)>(_a[6])),(*reinterpret_cast< int(*)>(_a[7]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listCodecsChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listSampleRateChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listChannelChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listEndianzChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listDevicesChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listSampleSizeChanged)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::nearistParamsChanged)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::saveDoneChanged)) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listDurationChanged)) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (AudioConfig::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfig::listOutputChanged)) {
                *result = 9;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 4:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QAudioFormat::Endian> >(); break;
        case 8:
        case 5:
        case 2:
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<int> >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<AudioConfig *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QStringList*>(_v) = _t->listDevices(); break;
        case 1: *reinterpret_cast< QList<int>*>(_v) = _t->listSampleRate(); break;
        case 2: *reinterpret_cast< QList<int>*>(_v) = _t->listChannel(); break;
        case 3: *reinterpret_cast< QStringList*>(_v) = _t->listCodecs(); break;
        case 4: *reinterpret_cast< QList<QAudioFormat::Endian>*>(_v) = _t->listEndianz(); break;
        case 5: *reinterpret_cast< QList<int>*>(_v) = _t->listSampleSize(); break;
        case 6: *reinterpret_cast< QStringList*>(_v) = _t->listDuration(); break;
        case 7: *reinterpret_cast< QStringList*>(_v) = _t->listOutput(); break;
        case 8: *reinterpret_cast< QList<int>*>(_v) = _t->nearistParams(); break;
        case 9: *reinterpret_cast< bool*>(_v) = _t->saveDone(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<AudioConfig *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setListDevices(*reinterpret_cast< QStringList*>(_v)); break;
        case 1: _t->setListSampleRate(*reinterpret_cast< QList<int>*>(_v)); break;
        case 2: _t->setListChannel(*reinterpret_cast< QList<int>*>(_v)); break;
        case 3: _t->setListCodecs(*reinterpret_cast< QStringList*>(_v)); break;
        case 4: _t->setListEndianz(*reinterpret_cast< QList<QAudioFormat::Endian>*>(_v)); break;
        case 5: _t->setListSampleSize(*reinterpret_cast< QList<int>*>(_v)); break;
        case 7: _t->setListOutput(*reinterpret_cast< QStringList*>(_v)); break;
        case 9: _t->setSaveDone(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject AudioConfig::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_AudioConfig.data,
    qt_meta_data_AudioConfig,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *AudioConfig::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AudioConfig::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AudioConfig.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int AudioConfig::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 12;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 10;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void AudioConfig::listCodecsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void AudioConfig::listSampleRateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void AudioConfig::listChannelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void AudioConfig::listEndianzChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void AudioConfig::listDevicesChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void AudioConfig::listSampleSizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void AudioConfig::nearistParamsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void AudioConfig::saveDoneChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void AudioConfig::listDurationChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void AudioConfig::listOutputChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
