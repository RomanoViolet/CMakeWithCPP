#ifndef COMPONENTA_HPP
#define COMPONENTA_HPP

#include <Interface_A.hpp>
#include <Interface_B.hpp>
/**
 * @brief The public header for Component which performs logic A required for the application.
 * @version 1.3
 * @warning Not fully tested. See <a href=www.google.com>Here</a> for details.
 */
class ComponentA
{
    public:
    ComponentA() : inputPort() {}

    /**
     * @brief A transport logic can directly write into inputPort with values to be used for computation.
     * @introduced March 2018
     */
    InterfaceA inputPort;

    /**
     * @brief The outputPort communicates data with other components.
     * @details The set'ter is used by ComponentA whereas get'ter is used by the customer.
     * @introduced March 2019
     */
    InterfaceB outputPort;

    /**
     * @brief A publically accessible method used by the customer to trigger a computation \f$ \text{outputPort} \leftarrow \mathit{f}(\text{inputPort}) \f$
     */
    void compute();

    /**
     * @note private parts are encapsulated in the library (i.e., PIMPL'd.).
     * @details See <a href=https://github.com/RomanoViolet/CPP-Snippets/tree/PIMPL-With-UniquePtr-PlacementNew>here</a> for details.
     * 
     */
};

#endif