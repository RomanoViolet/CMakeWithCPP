#ifndef INTERFACE_B_HPP
#define INTERFACE_B_HPP

/**
 * @class InterfaceB
 * @brief This class provides a way to communicate data with components that are used to build the complete applications.
 * @version 1.2
 * Interaction with this class is only via set'ters and get'ters.
 * 
 */
class InterfaceB
{
  public:
    InterfaceB() : m_Member_1(0U), m_Member_2(1.4F), m_Member_3(9.8)
    {
    }
    ~InterfaceB() = default;

    /**
     * @brief Set the Member 1 object
     * 
     * @param arg 
     */
    void setMember_1(unsigned short arg);

    /**
     * @brief Set the Member 2 object
     * 
     * @param arg 
     */
    void setMember_2(float arg);

    /**
     * @brief Set the Member 3 object
     * 
     * @param arg 
     */
    void setMember_3(double arg);

    /**
     * @brief Get the Member 3 object
     * 
     * @return double 
     */
    double getMember_3();

  private:
    /**
     * @var Some documentation related to m_Member_1. The "introduced" tag allows a customer to trace when a change to the interface was applied.
     * @introduced December 2018
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
    double m_Member_3;
};

#endif