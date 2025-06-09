# Tools
IVERILOG       := iverilog
VVP            := vvp
GTKWave        := gtkwave

# Compiler flags
IVERILOG_FLAGS := -g2012

# Output simulation executable
TARGET         := sim.vvp

# Default VCD file (your testbench should dump to this name)
WAVEFORM_FILE  := sim.vcd

# Source files to compile; pass them on the make command line:
#   make run FILES="mod1.v mod2.v tb_mod1.v"
FILES ?=

.PHONY: all compile run clean test_unique_selector

# Default target: compile & run
all: run

# Compile the given FILES into $(TARGET)
compile:
	@if [ -z "$(FILES)" ]; then \
	  echo "Error: no source files specified.  Use e.g. make run FILES=\"a.v b.v tb.v\""; \
	  exit 1; \
	fi
	@echo "Compiling: $(FILES)"
	$(IVERILOG) $(IVERILOG_FLAGS) -o $(TARGET) $(FILES)

# Run the simulation (after compile)
run: compile
	@echo "Running simulation: $(TARGET)"
	$(VVP) $(TARGET)

# Open waveform in GTKWave
view_wave:
	@echo "Opening waveform $(WAVEFORM_FILE)..."
	$(GTKWave) $(WAVEFORM_FILE)

# Clean up generated files
clean:
	@echo "Cleaning up..."
	@rm -f $(TARGET) *.vcd

# Module tests
test_timer:
	@$(MAKE) run FILES="v_src/timer.v test/tb_timer.v"

test_clock_gen:
	@$(MAKE) run FILES="v_src/clock_generator.v test/tb_clock_generator.v"
	@$(MAKE) view_wave

test_lfsr_prng:
	@$(MAKE) run FILES="v_src/lfsr_prng.v test/tb_lfsr_prng.v"
	@$(MAKE) view_wave

test_xor_shift_prng:
	@$(MAKE) run FILES="v_src/xor_shift_prng.v test/tb_xor_shift_prng.v"
	@$(MAKE) view_wave

test_unique_selector:
	@$(MAKE) run FILES="v_src/unique_selector.v v_src/lfsr_prng.v test/tb_unique_selector.v"

# Hardware moduel tests
test_led_matrix_encoder:
	@$(MAKE) run FILES="v_src/led_matrix_encoder.v test/tb_led_matrix_encoder.v"

test_button_matrix_decoder:
	@$(MAKE) run FILES="v_src/button_matrix_decoder.v test/tb_button_matrix_decoder.v"