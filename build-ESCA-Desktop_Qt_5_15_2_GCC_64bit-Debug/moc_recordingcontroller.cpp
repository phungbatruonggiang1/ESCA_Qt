/****************************************************************************
** Meta object code from reading C++ file 'recordingcontroller.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/audiorecording/recordingcontroller.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QVector>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'recordingcontroller.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_RecordingController_t {
    QByteArrayData data[32];
    char stringdata0[587];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_RecordingController_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_RecordingController_t qt_meta_stringdata_RecordingController = {
    {
QT_MOC_LITERAL(0, 0, 19), // "RecordingController"
QT_MOC_LITERAL(1, 20, 18), // "bufferChartChanged"
QT_MOC_LITERAL(2, 39, 0), // ""
QT_MOC_LITERAL(3, 40, 13), // "dataChartSent"
QT_MOC_LITERAL(4, 54, 32), // "recommendSampleRateBufferChanged"
QT_MOC_LITERAL(5, 87, 29), // "recommendChannelBufferChanged"
QT_MOC_LITERAL(6, 117, 26), // "recommendResoultionChanged"
QT_MOC_LITERAL(7, 144, 21), // "recommendCodecChanged"
QT_MOC_LITERAL(8, 166, 15), // "handleDataReady"
QT_MOC_LITERAL(9, 182, 16), // "QVector<quint32>"
QT_MOC_LITERAL(10, 199, 6), // "buffer"
QT_MOC_LITERAL(11, 206, 14), // "startRecording"
QT_MOC_LITERAL(12, 221, 13), // "stopRecording"
QT_MOC_LITERAL(13, 235, 20), // "editRecordParameters"
QT_MOC_LITERAL(14, 256, 6), // "device"
QT_MOC_LITERAL(15, 263, 4), // "path"
QT_MOC_LITERAL(16, 268, 10), // "sampleRate"
QT_MOC_LITERAL(17, 279, 13), // "bitsPerSample"
QT_MOC_LITERAL(18, 293, 8), // "duration"
QT_MOC_LITERAL(19, 302, 28), // "loadAduioConfigureParameters"
QT_MOC_LITERAL(20, 331, 16), // "QVector<QString>"
QT_MOC_LITERAL(21, 348, 28), // "saveAduioConfigureParameters"
QT_MOC_LITERAL(22, 377, 11), // "configValue"
QT_MOC_LITERAL(23, 389, 23), // "getInputAudioDeviceList"
QT_MOC_LITERAL(24, 413, 24), // "getOutputAudioDeviceList"
QT_MOC_LITERAL(25, 438, 19), // "setInputAudioDevice"
QT_MOC_LITERAL(26, 458, 20), // "setOutputAudioDevice"
QT_MOC_LITERAL(27, 479, 11), // "bufferChart"
QT_MOC_LITERAL(28, 491, 25), // "recommendSampleRateBuffer"
QT_MOC_LITERAL(29, 517, 22), // "recommendChannelBuffer"
QT_MOC_LITERAL(30, 540, 25), // "recommendResoultionBuffer"
QT_MOC_LITERAL(31, 566, 20) // "recommendCodecBuffer"

    },
    "RecordingController\0bufferChartChanged\0"
    "\0dataChartSent\0recommendSampleRateBufferChanged\0"
    "recommendChannelBufferChanged\0"
    "recommendResoultionChanged\0"
    "recommendCodecChanged\0handleDataReady\0"
    "QVector<quint32>\0buffer\0startRecording\0"
    "stopRecording\0editRecordParameters\0"
    "device\0path\0sampleRate\0bitsPerSample\0"
    "duration\0loadAduioConfigureParameters\0"
    "QVector<QString>\0saveAduioConfigureParameters\0"
    "configValue\0getInputAudioDeviceList\0"
    "getOutputAudioDeviceList\0setInputAudioDevice\0"
    "setOutputAudioDevice\0bufferChart\0"
    "recommendSampleRateBuffer\0"
    "recommendChannelBuffer\0recommendResoultionBuffer\0"
    "recommendCodecBuffer"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_RecordingController[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      16,   14, // methods
       5,  130, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   94,    2, 0x06 /* Public */,
       3,    1,   95,    2, 0x06 /* Public */,
       4,    0,   98,    2, 0x06 /* Public */,
       5,    0,   99,    2, 0x06 /* Public */,
       6,    0,  100,    2, 0x06 /* Public */,
       7,    0,  101,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    1,  102,    2, 0x08 /* Private */,

 // methods: name, argc, parameters, tag, flags
      11,    0,  105,    2, 0x02 /* Public */,
      12,    0,  106,    2, 0x02 /* Public */,
      13,    5,  107,    2, 0x02 /* Public */,
      19,    0,  118,    2, 0x02 /* Public */,
      21,    1,  119,    2, 0x02 /* Public */,
      23,    0,  122,    2, 0x02 /* Public */,
      24,    0,  123,    2, 0x02 /* Public */,
      25,    1,  124,    2, 0x02 /* Public */,
      26,    1,  127,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 9,   10,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Int,   14,   15,   16,   17,   18,
    0x80000000 | 20,
    QMetaType::Void, 0x80000000 | 20,   22,
    0x80000000 | 20,
    0x80000000 | 20,
    QMetaType::Void, QMetaType::QString,   14,
    QMetaType::Void, QMetaType::QString,   14,

 // properties: name, type, flags
      27, 0x80000000 | 9, 0x0049500b,
      28, 0x80000000 | 20, 0x00495009,
      29, 0x80000000 | 20, 0x00495009,
      30, 0x80000000 | 20, 0x00495009,
      31, 0x80000000 | 20, 0x00495009,

 // properties: notify_signal_id
       0,
       2,
       3,
       4,
       5,

       0        // eod
};

void RecordingController::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<RecordingController *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->bufferChartChanged(); break;
        case 1: _t->dataChartSent((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->recommendSampleRateBufferChanged(); break;
        case 3: _t->recommendChannelBufferChanged(); break;
        case 4: _t->recommendResoultionChanged(); break;
        case 5: _t->recommendCodecChanged(); break;
        case 6: _t->handleDataReady((*reinterpret_cast< const QVector<quint32>(*)>(_a[1]))); break;
        case 7: _t->startRecording(); break;
        case 8: _t->stopRecording(); break;
        case 9: _t->editRecordParameters((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5]))); break;
        case 10: { QVector<QString> _r = _t->loadAduioConfigureParameters();
            if (_a[0]) *reinterpret_cast< QVector<QString>*>(_a[0]) = std::move(_r); }  break;
        case 11: _t->saveAduioConfigureParameters((*reinterpret_cast< const QVector<QString>(*)>(_a[1]))); break;
        case 12: { QVector<QString> _r = _t->getInputAudioDeviceList();
            if (_a[0]) *reinterpret_cast< QVector<QString>*>(_a[0]) = std::move(_r); }  break;
        case 13: { QVector<QString> _r = _t->getOutputAudioDeviceList();
            if (_a[0]) *reinterpret_cast< QVector<QString>*>(_a[0]) = std::move(_r); }  break;
        case 14: _t->setInputAudioDevice((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 15: _t->setOutputAudioDevice((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 6:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QVector<quint32> >(); break;
            }
            break;
        case 11:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QVector<QString> >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (RecordingController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&RecordingController::bufferChartChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (RecordingController::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&RecordingController::dataChartSent)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (RecordingController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&RecordingController::recommendSampleRateBufferChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (RecordingController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&RecordingController::recommendChannelBufferChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (RecordingController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&RecordingController::recommendResoultionChanged)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (RecordingController::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&RecordingController::recommendCodecChanged)) {
                *result = 5;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 4:
        case 3:
        case 2:
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QVector<QString> >(); break;
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QVector<quint32> >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<RecordingController *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QVector<quint32>*>(_v) = _t->getBufferChart(); break;
        case 1: *reinterpret_cast< QVector<QString>*>(_v) = _t->getRecommendSampleRateBuffer(); break;
        case 2: *reinterpret_cast< QVector<QString>*>(_v) = _t->getRecommendChannelBuffer(); break;
        case 3: *reinterpret_cast< QVector<QString>*>(_v) = _t->getRecommendResoultionBuffer(); break;
        case 4: *reinterpret_cast< QVector<QString>*>(_v) = _t->getRecommendCodecBuffer(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<RecordingController *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setbufferChart(*reinterpret_cast< QVector<quint32>*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject RecordingController::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_RecordingController.data,
    qt_meta_data_RecordingController,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *RecordingController::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *RecordingController::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_RecordingController.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int RecordingController::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 16)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 16;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 16)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 16;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 5;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void RecordingController::bufferChartChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void RecordingController::dataChartSent(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void RecordingController::recommendSampleRateBufferChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void RecordingController::recommendChannelBufferChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void RecordingController::recommendResoultionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void RecordingController::recommendCodecChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
