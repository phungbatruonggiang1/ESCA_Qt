/****************************************************************************
** Meta object code from reading C++ file 'audioconfigfile.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../ESCA/src/modules/audiorecording/audioconfigfile.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QVector>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'audioconfigfile.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_AudioConfigFile_t {
    QByteArrayData data[7];
    char stringdata0[138];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AudioConfigFile_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AudioConfigFile_t qt_meta_stringdata_AudioConfigFile = {
    {
QT_MOC_LITERAL(0, 0, 15), // "AudioConfigFile"
QT_MOC_LITERAL(1, 16, 33), // "saveAudioConfigureParamtersSi..."
QT_MOC_LITERAL(2, 50, 0), // ""
QT_MOC_LITERAL(3, 51, 11), // "configValue"
QT_MOC_LITERAL(4, 63, 28), // "saveAudioConfigureParameters"
QT_MOC_LITERAL(5, 92, 16), // "QVector<QString>"
QT_MOC_LITERAL(6, 109, 28) // "loadAudioConfigureParameters"

    },
    "AudioConfigFile\0saveAudioConfigureParamtersSignal\0"
    "\0configValue\0saveAudioConfigureParameters\0"
    "QVector<QString>\0loadAudioConfigureParameters"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AudioConfigFile[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   29,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    1,   32,    2, 0x0a /* Public */,
       6,    0,   35,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 5,    3,
    0x80000000 | 5,

       0        // eod
};

void AudioConfigFile::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AudioConfigFile *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->saveAudioConfigureParamtersSignal((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->saveAudioConfigureParameters((*reinterpret_cast< const QVector<QString>(*)>(_a[1]))); break;
        case 2: { QVector<QString> _r = _t->loadAudioConfigureParameters();
            if (_a[0]) *reinterpret_cast< QVector<QString>*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
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
            using _t = void (AudioConfigFile::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AudioConfigFile::saveAudioConfigureParamtersSignal)) {
                *result = 0;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject AudioConfigFile::staticMetaObject = { {
    QMetaObject::SuperData::link<AccessFile::staticMetaObject>(),
    qt_meta_stringdata_AudioConfigFile.data,
    qt_meta_data_AudioConfigFile,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *AudioConfigFile::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AudioConfigFile::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AudioConfigFile.stringdata0))
        return static_cast<void*>(this);
    return AccessFile::qt_metacast(_clname);
}

int AudioConfigFile::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = AccessFile::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}

// SIGNAL 0
void AudioConfigFile::saveAudioConfigureParamtersSignal(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
