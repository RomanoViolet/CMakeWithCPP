#include "ComponentA.hpp"

/**
 * @brief Computes \f$ \text{InterfaceB::outputPort} \leftarrow \mathit{f}(\text{InterfaceA::inputPort}) \f$
 * @requirement ComponentA:R-004
 * 
 */
void ComponentA::compute()
{
    // do something with the input port data
    
    // locals
    unsigned short setLampTilt = 0U;
    float roadInclination = 0.0F;
    bool isIntelligentLightingRequested = false;

    setLampTilt = this->inputPort.brightness + 2U;
    roadInclination = setLampTilt * 2.1F * this->inputPort.curvature;
    isIntelligentLightingRequested = (this->inputPort.steeringAngle > 0.1F);

    // set the values to the output port
    this->outputPort.setLampTilt(setLampTilt);
    this->outputPort.setroadInclination(roadInclination);
    this->outputPort.setIsIntelligentLightingRequested(isIntelligentLightingRequested);

}