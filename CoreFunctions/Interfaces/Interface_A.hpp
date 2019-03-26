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
    InterfaceA() : m_Member_1(1U), m_Member_2(3.4F), m_Member_3(3.4)
    {
    }
    ~InterfaceA() = default;

    /**
     * @var Some documentation related to m_Member_1. The "introduced" tag allows a customer to trace when a change to the interface was applied.
     * @introduced March 2018
     */
    unsigned short m_Member_1;

    /**
     * @var Some documentation related to m_Member_2. The "introduced" tag allows a customer to trace when a change to the interface was applied.
     * @introduced March 2018
     */

    float m_Member_2;

    /**
     * @var Some documentation related to m_Member_3. Th "deprecated" tag allows the customer to trace when this member was withdrawn.
     * 
     */
    [[deprecated]] double m_Member_3;
};

#endif