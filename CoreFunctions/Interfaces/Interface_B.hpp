#ifndef INTERFACE_B_HPP
#define INTERFACE_B_HPP

#include <gtest/gtest_prod.h>

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
    InterfaceB() : lampTilt(0U), roadInclination(1.4F), isIntelligentLightingRequested(false)
    {
    }
    ~InterfaceB() = default;

    /**
     * @fn setLampTilt
     * @brief Set the lampTilt
     * @introduced February 2018
     * @requirement InterfaceB-001
     * @param arg
     */
    void setLampTilt(unsigned short arg);

    /**
     * @fn setroadInclination
     * @brief Set the roadInclination via setroadInclination
     * @introduced February 2018
     * @requirement InterfaceB-002
     *
     * @param arg
     */
    void setroadInclination(float arg);

    /**
     * @fn setIsIntelligentLightingRequested
     * @brief Set the IsIntelligentLightingRequested via setIsIntelligentLightingRequested
     * @introduced January 2018
     * @requirement InterfaceB-003
     * @param binaryChoice
     * @warning The requirement is under discussion, and this interface may be withdrawn following the discussion.
     */
    void setIsIntelligentLightingRequested(bool binaryChoice);

    /**
     * @fn getIsIntelligentLightingRequested
     * @brief Get the getIsIntelligentLightingRequested object
     * @requirement InterfaceB-004
     * @warning The requirement is under discussion, and this interface may be withdrawn following the discussion.
     * @return bool
     */
    bool getIsIntelligentLightingRequested();

  private:
    /**
     * @var lampTilt
     * @details Some documentation related to lampTilt. The "introduced" tag allows a customer to trace when a change to the interface was applied.
     * @introduced February 2018
     * @requirement: InterfaceB-001
     */
    unsigned short lampTilt;

    /**
     * @var roadInclination
     * @details Some documentation related to roadInclination. The "introduced" tag allows a customer to trace when a change to the interface was applied.
     * @introduced February 2018
     * @requirement InterfaceB-002
     */

    float roadInclination;

    /**
     * @var isIntelligentLightingRequested
     * @details Some documentation related to isIntelligentLightingRequested. Th "deprecated" tag allows the customer to trace when this member was withdrawn.
     * @introduced January 2018
     * @requirement InterfaceB-003
     * @warning The requirement is under discussion, and this parameter may be withdrawn following the discussion.
     */
    bool isIntelligentLightingRequested;

    /**
     * @brief FRIEND_TEST is a Google-Test macro used for testing private members of a class.
     * @details The following macro tests the setLampTilt method and the associated private member
     */
    FRIEND_TEST(InterfaceB, R_001);

    /**
     * @brief FRIEND_TEST is a Google-Test macro used for testing private members of a class.
     * @details The following macro tests the setroadInclination method and the associated private member
     */
    FRIEND_TEST(InterfaceB, R_002);

    /**
     * @brief FRIEND_TEST is a Google-Test macro used for testing private members of a class.
     * @details The following macro tests the setisIntelligentLightingRequested method and the associated private member
     */
    FRIEND_TEST(InterfaceB, R_003);
};

#endif
