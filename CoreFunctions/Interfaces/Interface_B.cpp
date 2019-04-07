#include "Interface_B.hpp"

/**
 * @brief Implements methods for class Interface_B
 * 
 */

void InterfaceB::setLampTilt(unsigned short arg)
{
    this->lampTilt = arg;
}

void InterfaceB::setroadInclination(float arg)
{
    this->roadInclination = arg;
}

void InterfaceB::setIsIntelligentLightingRequested(bool arg)
{
    this->isIntelligentLightingRequested = arg;
}

bool InterfaceB::getIsIntelligentLightingRequested()
{
    return (this->isIntelligentLightingRequested);
}