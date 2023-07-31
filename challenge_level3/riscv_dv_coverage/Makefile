TARGET := rv32i
TIMEOUT := 1200
TESTLIST := testlist.yaml
SIMULATOR := pyflow
ITERATIONS := 1

all: clean riscv_arithmetic_basic_test riscv_rand_instr_test riscv_jump_stress_test riscv_rand_jump_test riscv_loop_test

riscv_arithmetic_basic_test: riscv_arithmetic_basic_test_out/CoverageReport.txt
riscv_rand_instr_test: riscv_rand_instr_test_out/CoverageReport.txt
riscv_loop_test: riscv_loop_test_out/CoverageReport.txt
riscv_jump_stress_test: riscv_jump_stress_test_out/CoverageReport.txt
riscv_rand_jump_test: riscv_rand_jump_test_out/CoverageReport.txt


%_out/CoverageReport.txt:
	run -o $*_out --target $(TARGET) --gen_timeout $(TIMEOUT) --test $* --testlist $(TESTLIST) --simulator $(SIMULATOR) -i $(ITERATIONS)

	@for i in $$(seq $(ITERATIONS)); do \
        python /tools/riscv-dv/scripts/spike_log_to_trace_csv.py --log $*_out/spike_sim/$*.$$(($$i-1)).log --csv $*_out/$*_trace$$(($$i-1)).csv -f; \
    done

	@for i in $$(seq $(ITERATIONS)); do \
		python /tools/riscv-dv/pygen/pygen_src/test/riscv_instr_cov_test.py --num_of_tests=1 --start_idx=0 --asm_file_name=$*_out/asm_test/$*_$$(($$i-1)).S --trace_csv=$*_out/$*_trace$$(($$i-1)).csv --log_file_name=$*_out/sim_$*_0.log --target=$(TARGET) --seed=2033903432 --disable_compressed_instr=1; \
	done


clean:
	rm -rf riscv_*


