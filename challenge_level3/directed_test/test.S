# See LICENSE for license details.

#*****************************************************************************
# add.S
#-----------------------------------------------------------------------------
#
# Test add instruction.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  // Test cases for 100% functional coverage
  //TEST_RR_OP( 1,  add, 0x00000001, 0x00000001, 0x00000000 ); // Test case 1: Simple addition
  //TEST_RR_OP( 2,  add, 0x00000002, 0x00000001, 0x00000001 ); // Test case 2: Non-zero addition
  TEST_RR_OP( 3,  add, 0x00000001, 0x00000002, 0xFFFFFFFF ); // Test case 3: Addition with negative numbers
  //TEST_RR_OP( 4,  add, 0x7FFFFFFF, 0x00000001, 0x80000000 ); // Test case 4: Addition with overflow (signed)
  //TEST_RR_OP( 5,  add, 0xFFFFFFFF, 0x00000001, 0x00000000 ); // Test case 5: Addition with overflow (unsigned)

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------
  lh rd, offset(rs1)

  TEST_LD_OP( 6, lh, 0x10, 0x04, 0x00001000 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
