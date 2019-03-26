#include "Interface_B.hpp"

/**
 * @brief Implements methods for class Interface_B
 * 
 */

void InterfaceB::setMember_1(unsigned short arg)
{
    this->m_Member_1 = arg;
}

void InterfaceB::setMember_2(float arg)
{
    this->m_Member_2 = arg;
}

void InterfaceB::setMember_3(double arg)
{
    this->setMember_3 = arg;
}

double InterfaceB::getMember_3()
{
    return (this->m_Member_3);
}