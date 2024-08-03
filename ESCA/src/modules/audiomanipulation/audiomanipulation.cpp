#include "audiomanipulation.h"

AudioManipulation::AudioManipulation(QObject *parent) : QObject(parent)
{
    // Implement any necessary initialization here
}


QString AudioManipulation::getFilePath()
{
    return filePath;
}

