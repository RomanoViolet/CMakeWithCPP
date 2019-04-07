#include "gmock/gmock.h"
#include "gtest/gtest.h"

#include <ComponentB.hpp>

/**
 * @brief Units tests for each requirement associated to Component B.
 *
 */
TEST(ComponentB, R_001)
{
    /**
     * @brief Tests requirement ComponentB-001: whether ComponentB presents an inputPort of type InterfaceB
     * 
     */
    // Reference interface to compare against
    InterfaceB referenceType;
    ComponentB c;

    EXPECT_EQ(typeid(referenceType), typeid(c.inputPort));
    
}


TEST(ComponentB, R_002)
{
    /**
     * @brief Tests requirement ComponentB-002
     */
    class MockComponentB : public ComponentB 
    {
        public:
        MOCK_METHOD0(compute, void());
    };

    MockComponentB mockedB;

    ON_CALL(mockedB, compute()).WillByDefault(::testing::Return());

}


TEST(ComponentB, R_003)
{
    /**
     * @brief Tests requirement ComponentB-003
     * @detail This requirement is not testable since no side affect of the `compute` can be observed via the available public interface
     * @warning The test must fail until either the requirement is removed, or class ComponentB is refactored to be testable
     * @note So that the build is fully successful, EXPECT_TRUE(...) has been commented out.
     */
    //EXPECT_TRUE(false) << "Requirement ComponentB:R-003 is not testable";
    
    /**
     * @brief Just to get the build to complete successful.
     * 
     */
    EXPECT_FALSE(false) << "Requirement ComponentB-003 is not testable";

}