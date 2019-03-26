#include "ComponentB.hpp"
#include <iostream>

void ComponentB::compute()
{
    // do something with the input port data
    std::cout << inputPort.getMember_3() << std::endl;
    
}