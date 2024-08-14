#ifndef CHARTVIEW_H
#define CHARTVIEW_H

#include <QObject>
#include <QList>

class BaseChart : public QObject {
    Q_OBJECT

public:
    explicit BaseChart(QObject *parent = nullptr) : QObject(parent) {}
    virtual ~BaseChart() {}

    Q_INVOKABLE virtual void updateData(const QList<qreal> &data) = 0;

signals:
    void dataUpdated();
};

#endif // CHARTVIEW_H
