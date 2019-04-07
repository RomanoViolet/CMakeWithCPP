#include "gmock/gmock.h"
#include "gtest/gtest.h"

#include <ComponentA.hpp>
#include <Interface_A.hpp>

/**
 * @brief Units tests for each requirement associated to Component A.
 *
 */
TEST(ComponentA, R_001)
{
    /**
     * @brief Tests requirement ComponentA:R-001
     */
    ComponentA c;

    // The refernece type against which the test must be made
    InterfaceA referenceInterface;

    // test the type of inputPort
    EXPECT_EQ(typeid(referenceInterface), typeid(c.inputPort));
}

TEST(ComponentA, R_002)
{
    /**
     * @brief Tests requirement ComponentA:R-002
     */
    ComponentA c;

    // The reference type against which the test must be made
    InterfaceB referenceInterface;

    // test the type of inputPort
    EXPECT_EQ(typeid(referenceInterface), typeid(c.outputPort));
}


TEST(ComponentA, R_003)
{
    /**
     * @brief Tests requirement ComponentA:R-003
     */
    class MockComponentA : public ComponentA 
    {
        public:
        MOCK_METHOD0(compute, void());
    };

    MockComponentA mockedA;

    ON_CALL(mockedA, compute()).WillByDefault(::testing::Return());

}


TEST(ComponentA, R_004)
{
    /**
     * @brief Tests requirement ComponentA:R-004
     */

    ComponentA c;

    // In order to test that the outputPort computes deterministically, the relationship between
    // inputPort and outputPort must be known.
    // Specifically, the inputPort is provided a known value, and the value of the outputPort is checked.
    

    // Fill in only one of the fields which directly affects outputPort.IsIntelligentLightingRequested
    c.inputPort.steeringAngle = 0.2F;

    // compute
    c.compute();

    // test for equality as the output type is a bool
    EXPECT_EQ(true, c.outputPort.getIsIntelligentLightingRequested());
}
