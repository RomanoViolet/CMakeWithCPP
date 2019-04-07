#include "ComponentB.hpp"
#include <iostream> 
#include <MyFancySquareRoot.hpp>

/**
  *  @note the following header provides a C-function.
  *       Notice that the ComponentB expects the function to be at a path specified.
  *       It is possible to refactor ComponentB so that the #include path may be changed, but in practice
  *       there may be hundreds of source files which rely on some legacy component, so refactoring all
  *       sources unduly adds to the test and re-verification effort. Therefore, it is more useful to just
  *       put the legacy functions at a path expected by sources, such as ComponentB by creating a directory structure at build time.
  *       The legacy C-sources will be compiled with a C++ compiler.
  */
#include <Legacy.h>

/**
 * @brief Computes \f$ \mathit{f}(\text{InterfaceB::inputPort}) \f$
 * @requirement ComponentB-003
 */

void ComponentB::compute()
{
    // do something with the input port data
    std::cout << "Component B computed: ";
    std::cout << std::boolalpha;
    std::cout << inputPort.getIsIntelligentLightingRequested() << std::endl;

    float a = 10.F;
    float b = 11.3F;
    std::cout << "Result from Legacy function: " << doLegacyCompute(a, b) << std::endl;

    MyFancySquareRoot sqRoot(static_cast<double>(a));

    std::cout << "Result from Fancy Square Root: " << sqRoot.getSquareRoot() << std::endl;

}
