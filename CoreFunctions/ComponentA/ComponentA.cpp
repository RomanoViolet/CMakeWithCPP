#include "ComponentA.hpp"

void ComponentA::compute()
{
    // do something with the input port data
    
    // locals
    unsigned short m_Member_1 = 0U;
    float m_Member_2 = 0.0F;
    double m_Member_3 = 0;

    m_Member_1 = this->inputPort.m_Member_1 + 2U;
    m_Member_2 = m_Member_1 * 2.1F * this->inputPort.m_Member_2;
    m_Member_3 = this->inputPort.m_Member_3 / 9.3;

    // set the values to the output port
    this->outputPort.setMember_1(m_Member_1);
    this->outputPort.setMember_2(m_Member_2);
    this->outputPort.setMember_3(m_Member_3);


}