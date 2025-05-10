# 32 bit Adder-Subtractor  

The 32bit operands in the register can be interpreted as signed or unsigned depending on the sign status input "Si".  
Implements Addition or Subtraction of two 32 bit operands.  

## Addition  
For operation code = 0, Addition is performed.

Unsigned : 
Numerical Range : 0 - 2^33-2 (8.58993459×10⁹)  
This requires a 33 bit long binary number. The 33rd bit is equivalent to Cout

Signed in 2's complement form:  
Numerical range: -2^32 - 2^32-2 i.e. -4.294967296×10⁹ - 4.294967294×10⁹


## Subtraction  
A - Minuend  
B - Subtrahend  
D - Difference  

Arithmetic Subtraction is performed by adding the subtrahend in it's 2's complement form with Minuend. 
For operation code = 1, Subtraction is performed.

Unsigned : 
The original operands are 32 bit unsigned numbers. The 2's complement of the subtrahend is found and added with the minuend to obtain difference.  

### 
The carry-out flag is critical to indicate the result after subtration. In other words the result of unsigned subtraction is a number in sign magnitude representation. It is the programmer's responsibility to interpret the result correctly.  

ex: A = 4'b0000=4'd0; B=4'b1111=4'd15;  
    A-B = A    + 2^4 - B;  
        = 0000 + 0001  
        = 0001  
    The value stored in D is 2's complement of 1111.  
    The result should be interpreted as 2's complement of 0001 i.e. 1111(decimal 15) and the Cout=0 is to indicate the negative sign  


| Condition  | Mathematical result | 32 bit stored value | Carry flag |
-------------|---------------------|---------------------|------------|
|A>=B        |   A-B (Positive)    |    A-B              |       1    |
|A< B        |   A-B (Negative)    |  -(A-B)             |       0    |

Numerical Range : -(2^32 -1) to (2^32 - 1) i.e. -4.294967295×10⁹ to 4.294967295×10⁹  

Signed in 2's complement form:  
For a 32 bit signed number having range: -2^31 to 2^31 -1, the range of calculated difference is :-(2^32-1) to 2^32-1, i.e. -4.294967295×10⁹ to 4.294967295×10⁹. But to represent -2^32-1 in 2's complement form, we require 33 bits.  
ex: for a 4 bit signed number, the range is -8 to 7. After subtraction, the range of difference is -15 to 15. However, a 4 bit can only represent from -8 to 7. So Overflow occurs.

Actual numerical range: -2^31 to 2^31 - 1.

Overflow V= Cout exor CinMSB. Overflow flag = 1 indicates an invalid signed arithmetic.

## Operation table:  
|D  |  Si  | Cin | Operation                                               |
|---|------|-----|---------------------------------------------------------|
| 0 |  0   |  0  |Unsigned Addition                                        |
| 0 |  0   |  1  |Unsigned Addition with input carry                       |
| 0 |  1   |  0  |Signed Addition (operand stored in 2's complement form)  |
| 0 |  1   |  1  |Signed Addition with input carry                         |
| 1 |  0   |  x  |Unsigned Subtraction                                     |
| 1 |  1   |  x  |Signed Subtraction(operand stored in 2's complement form)|

