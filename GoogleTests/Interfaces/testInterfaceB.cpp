#include "gmock/gmock.h"
#include "gtest/gtest.h"

#include <Interface_B.hpp>

/**
 * @brief Units tests for each requirement associated to InterfaceB.
 *
 */
TEST(InterfaceB, R_001)
{
    /**
     * @brief Tests requirement InterfaceB:R-001
     */

    // Instantiate the type
    InterfaceB InterfaceB;

    // InterfaceB-R001 expects an unsigned 8-bit data stream. From the description of InterfaceB, the member that must satisfy
    // the requirement is `InterfaceB::brightness`
    
    // declare a variable that has the type expected by the requirement InterfaceB::R-001
    unsigned short referenceType;

    // set the value of lamp tilt
    InterfaceB.setLampTilt(7U);

    // The success of the setter is verified by inspecting the value of the member InterfaceB::lampTilt
    EXPECT_EQ(typeid(InterfaceB.lampTilt), typeid(referenceType));

    // Check whether the setter is successful
    EXPECT_EQ(7U, InterfaceB.lampTilt);
}



TEST(InterfaceB, R_002)
{
    /**
     * @brief Tests requirement InterfaceB:R-002
     */

    // Instantiate the type
    InterfaceB InterfaceB;

    // InterfaceB-R002 expects to set the current inclination of the road, currently provided by InterfaceB::setroadInclination

    // declare a variable that has the type expected by the requirement InterfaceB::R-002
    float referenceType;

    // set the value of lamp tilt
    InterfaceB.setroadInclination(0.5F);

    // The success of the setter is verified by inspecting the value of the member InterfaceB::roadInclination
    EXPECT_EQ(typeid(InterfaceB.roadInclination), typeid(referenceType));

    // check whether the setter is successful
    EXPECT_EQ(0.5F, InterfaceB.roadInclination);
}


TEST(InterfaceB, R_003)
{
    /**
     * @brief Tests requirement InterfaceB:R-003
     */

    // Instantiate the type
    InterfaceB InterfaceB;

    // InterfaceB-R003 expects to set intelligent lighting, currently provided by InterfaceB::setIsIntelligentLightingRequested

    // declare a variable that has the type expected by the requirement InterfaceB::R-003
    bool referenceType;

    // set the intelligent lighting request
    InterfaceB.setIsIntelligentLightingRequested(true);

    // The success of the setter is verified by inspecting the value of the member InterfaceB::isIntelligentLightingRequested
    EXPECT_EQ(typeid(InterfaceB.isIntelligentLightingRequested), typeid(referenceType));

    // check whether the setter is successful
    EXPECT_EQ(true, InterfaceB.getIsIntelligentLightingRequested());

    // set off the intelligent lighting request
    InterfaceB.setIsIntelligentLightingRequested(false);

    // check whether the setter is successful
    EXPECT_EQ(false, InterfaceB.getIsIntelligentLightingRequested());

}