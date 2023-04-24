import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge, Timer


@cocotb.test()

async def test_ro_ffd(dut):
    dut._log.info("start")
    dut.en.value = 0
    dut.rst.value = 1
    dut.sel.value = 0
    await Timer(5000000, units="ps") 
    dut.en.value = 1
    dut.rst.value = 0
    dut.sel.value = 1
    await Timer(500000000, units="ps") 
