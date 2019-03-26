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
    InterfaceB() : lampTilt(0U), roadInclination(1.4F), isIntelligentLightingRequested(false)
    {
    }
    ~InterfaceB() = default;

    /**
     * @brief Set the lampTilt
     * @introduced February 2018
     * @requirement InterfaceB:R-001
     * @param arg
     */
    void setLampTilt(unsigned short arg);

    /**
     * @brief Set the roadInclination
     * @introduced February 2018
     * @requirement InterfaceB-R002
     *
     * @param arg
     */
    void setroadInclination(float arg);

    /**
     * @brief Set the isIntelligentLightingRequested
     * @introduced January 2018
     * @requirement InterfaceB-R003
     * @param binaryChoice
     * @warning The requirement is under discussion, and this interface may be withdrawn following the discussion.
     */
    void setIsIntelligentLightingRequested(bool binaryChoice);

    /**
     * @brief Get the Member 3 object
     * @requirement InterfaceB-R004
     * @warning The requirement is under discussion, and this interface may be withdrawn following the discussion.
     * @return bool
     */
    bool getIsIntelligentLightingRequested();

  private:
    /**
     * @var Some documentation related to lampTilt. The "introduced" tag allows a customer to trace when a change to the interface was applied.
     * @introduced February 2018
     * @requirement: R-001
     */
    unsigned short lampTilt;

    /**
     * @var Some documentation related to m_Member_2. The "introduced" tag allows a customer to trace when a change to the interface was applied.
     * @introduced February 2018
     * @requirement R-002
     */

    float roadInclination;

    /**
     * @var Some documentation related to m_Member_3. Th "deprecated" tag allows the customer to trace when this member was withdrawn.
     * @introduced January 2018
     * @requirement InterfaceB:R-003
     * @warning The requirement is under discussion, and this parameter may be withdrawn following the discussion.
     */
    bool isIntelligentLightingRequested;
};

#endif
