#ifndef INTERFACE_A_HPP
#define INTERFACE_A_HPP

/**
 * @class InterfaceA
 * @brief This class provides a way to communicate data with components that are used to build the complete applications.
 * @version 1.0
 * All members of this class may be acessed publicly.
 * 
 */
class InterfaceA
{
  public:
    /**
     * @brief Construct a new Interface A object. Members are intialized to random values, including a deprecated interface.
     * 
     */
    InterfaceA() : brightness(1U), curvature(0.0F), steeringAngle(0.01)
    {
    }
    ~InterfaceA() = default;

    /**
     * @var Some documentation related to brightness. The "introduced" tag allows a customer to trace when a change to the interface was applied.
     * @details brightness is received in the unit lumens
     * @introduced March 2018
     * @requirement InterfaceA:R-001.
     */
    unsigned short brightness;

    /**
     * @var Some documentation related to curvature in \f$ \frac{rad}{s} \f$. The "introduced" tag allows a customer to trace when a change to the interface was applied.
     * @introduced February 2018
     * @requirement InterfaceA:R-002
     */

    float curvature;

    /**
     * @var Some documentation related to steering angle in the unit of \f$ rad\f$. Th "deprecated" tag allows the customer to trace when this member was withdrawn.
     * @requirement InterfaceA:R-003
     */
    [[deprecated]] double steeringAngle;
};

#endif