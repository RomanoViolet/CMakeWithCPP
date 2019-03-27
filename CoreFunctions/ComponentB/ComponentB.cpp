#include "ComponentB.hpp"
#include <iostream>
/**
 * @brief Computes \f$\mathit{f}(\text{InterfaceB::inputPort})\f$
 * @requirement ComponentB:R-003
 */
void ComponentB::compute()
{
    // do something with the input port data
    std::cout << "Component B computed: ";
    std::cout << std::boolalpha;   
    std::cout << inputPort.getIsIntelligentLightingRequested() << std::endl;
    
}