#ifndef COMPONENTB_HPP
#define COMPONENTB_HPP

#include <Interface_B.hpp>
/**
 * @brief The public header for Component which performs logic A required for the application.
 * @version 1.3
 * @warning Not fully tested. See <a href=www.google.com>Here</a> for details.
 */
class ComponentB
{
    public:
    ComponentB() : inputPort() {}

    /**
     * @brief The inputPort receives data from the transport layer.
     * @introduced March 2018
     * @requirement ComponentB:R-001
     */
    InterfaceB inputPort;

    /**
     * @brief A publically accessible method used by the customer to trigger a computation \f$ \text{outputPort} \leftarrow \mathit{f}(\text{inputPort}) \f$
     * @introduced March 2018
     * @requirement ComponentA:R-002
     */
    void compute();

    /**
     * @note private parts are encapsulated in the library (i.e., PIMPL'd.).
     * @details See <a href=https://github.com/RomanoViolet/CPP-Snippets/tree/PIMPL-With-UniquePtr-PlacementNew>here</a> for details.
     * 
     */
};

#endif