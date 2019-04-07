#include "gmock/gmock.h"
#include "gtest/gtest.h"

#include <Interface_A.hpp>

/**
 * @brief Units tests for each requirement associated to InterfaceA.
 *
 */
TEST(InterfaceA, R_001)
{
    /**
     * @brief Tests requirement InterfaceA-001
     */

    // Instantiate the type
    InterfaceA interfaceA;

    // InterfaceA-R001 expects an unsigned 8-bit data stream. From the description of InterfaceA, the member that must satisfy
    // the requirement is `InterfaceA::brightness`
    
    // declare a variable that has the type expected by the requirement InterfaceA-001
    unsigned short referenceType;


    // test the type of inputPort
    EXPECT_EQ(typeid(interfaceA.brightness), typeid(referenceType));
}


TEST(InterfaceA, R_002)
{
    /**
     * @brief Tests requirement InterfaceA-002
     */

    // Instantiate the type
    InterfaceA interfaceA;

    // InterfaceA-002 expects a floating point number representing the sensed curvature of the road. 
    // This requirement is satisfied by the member InterfaceA::curvature
    
    // declare a variable that has the type expected by the requirement InterfaceA-002
    float referenceType;


    // test the type of inputPort
    EXPECT_EQ(typeid(interfaceA.curvature), typeid(referenceType));
}


TEST(InterfaceA, R_003)
{
    /**
     * @brief Tests requirement InterfaceA-003
     */

    // Instantiate the type
    InterfaceA interfaceA;

    // InterfaceA-003 expects a double-type number representing the steering angle. 
    // This requirement is satisfied by the member InterfaceA::steeringAngle
    
    // declare a variable that has the type expected by the requirement InterfaceA-003
    double referenceType;


    // test the type of inputPort
    EXPECT_EQ(typeid(interfaceA.steeringAngle), typeid(referenceType));
}

