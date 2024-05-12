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
    QByteArrayData data[20];
    char stringdata0[315];
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
QT_MOC_LITERAL(4, 54, 14), // "startRecording"
QT_MOC_LITERAL(5, 69, 13), // "stopRecording"
QT_MOC_LITERAL(6, 83, 20), // "editRecordParameters"
QT_MOC_LITERAL(7, 104, 6), // "device"
QT_MOC_LITERAL(8, 111, 4), // "path"
QT_MOC_LITERAL(9, 116, 10), // "sampleRate"
QT_MOC_LITERAL(10, 127, 13), // "bitsPerSample"
QT_MOC_LITERAL(11, 141, 8), // "duration"
QT_MOC_LITERAL(12, 150, 28), // "loadAduioConfigureParameters"
QT_MOC_LITERAL(13, 179, 16), // "QVector<QString>"
QT_MOC_LITERAL(14, 196, 28), // "saveAduioConfigureParameters"
QT_MOC_LITERAL(15, 225, 11), // "configValue"
QT_MOC_LITERAL(16, 237, 23), // "getInputAudioDeviceList"
QT_MOC_LITERAL(17, 261, 24), // "getOutputAudioDeviceList"
QT_MOC_LITERAL(18, 286, 13), // "m_bufferChart"
QT_MOC_LITERAL(19, 300, 14) // "QVector<float>"

    },
    "RecordingController\0bufferChartChanged\0"
    "\0dataChartSent\0startRecording\0"
    "stopRecording\0editRecordParameters\0"
    "device\0path\0sampleRate\0bitsPerSample\0"
    "duration\0loadAduioConfigureParameters\0"
    "QVector<QString>\0saveAduioConfigureParameters\0"
    "configValue\0getInputAudioDeviceList\0"
    "getOutputAudioDeviceList\0m_bufferChart\0"
    "QVector<float>"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_RecordingController[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       1,   82, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x06 /* Public */,
       3,    1,   60,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       4,    0,   63,    2, 0x02 /* Public */,
       5,    0,   64,    2, 0x02 /* Public */,
       6,    5,   65,    2, 0x02 /* Public */,
      12,    0,   76,    2, 0x02 /* Public */,
      14,    1,   77,    2, 0x02 /* Public */,
      16,    0,   80,    2, 0x02 /* Public */,
      17,    0,   81,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    2,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Int,    7,    8,    9,   10,   11,
    0x80000000 | 13,
    QMetaType::Void, 0x80000000 | 13,   15,
    0x80000000 | 13,
    0x80000000 | 13,

 // properties: name, type, flags
      18, 0x80000000 | 19, 0x0049500b,

 // properties: notify_signal_id
       0,

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
        case 2: _t->startRecording(); break;
        case 3: _t->stopRecording(); break;
        case 4: _t->editRecordParameters((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< int(*)>(_a[5]))); break;
        case 5: { QVector<QString> _r = _t->loadAduioConfigureParameters();
            if (_a[0]) *reinterpret_cast< QVector<QString>*>(_a[0]) = std::move(_r); }  break;
        case 6: _t->saveAduioConfigureParameters((*reinterpret_cast< const QVector<QString>(*)>(_a[1]))); break;
        case 7: { QVector<QString> _r = _t->getInputAudioDeviceList();
            if (_a[0]) *reinterpret_cast< QVector<QString>*>(_a[0]) = std::move(_r); }  break;
        case 8: { QVector<QString> _r = _t->getOutputAudioDeviceList();
            if (_a[0]) *reinterpret_cast< QVector<QString>*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 6:
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
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QVector<float> >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<RecordingController *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QVector<float>*>(_v) = _t->getBufferChart(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<RecordingController *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setbufferChart(*reinterpret_cast< QVector<float>*>(_v)); break;
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
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
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
QT_WARNING_POP
QT_END_MOC_NAMESPACE
