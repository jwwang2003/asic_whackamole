# Experiments sub-directory

- **`counter/`**  
  Contains a Verilog (or VHDL) implementation of a generic binary counter. This module demonstrates how to build a parametrizable up/down counter block.
  
- **`simple_counter/`**  
  Contains a trimmed-down version of the counter logic with only up-count functionality (no down-count, no enable signals). This was our first step to verify basic clock‐driven counting on the target FPGA.

- **`unique_selector_counter/`**  
  Contains the “unique number selector” that uses a simple RNG seed plus a bitmask/array to ensure no number is repeated until the full set has been emitted. In other words, it implements the logic for picking N distinct numbers without replacement. This folder also includes a small testbench showing how to integrate that selector with the counter from `simple_counter/`.

---

## 1. `counter/`

### What’s in this folder
- **`counter.v`**  
  A fully-featured up/down counter module with:  
  - Parameterizable width (generic N-bit counter)  
  - Synchronous reset (`rst_n`)  
  - Enable (`en`) input  
  - Direction (`dir`) input (0 = down, 1 = up)  
- **`counter_tb.v`** (testbench)  
  A self-checking testbench that toggles clock and direction lines to verify counter behavior for both up- and down-count.  
- **`README.md`** (optional)  
  Brief notes on how to compile and simulate this experiment alone.

### What it does
- Demonstrates a generic register-based counter design  
- Verifies correct rollover, reset behavior, and directional counting  
- Provides a template for any future modules that need a clock-driven index or timer

### Key accomplishments
- Proves out the timing and synthesis of an N-bit counter on the target FPGA  
- Provides a reference interface (e.g., `clk, rst_n, dir, en, out[N-1:0]`) that other experiments can hook into

### How it contributes to the bigger project/game
- Serves as the **foundation** for any timed or count-based feature (e.g., frame counters, state machines, or multiplex-addressed displays)  
- Used by subsequent experiments (e.g., `simple_counter/`) to gradually refine and simplify until we integrate with the 7-segment display logic

---

## 2. `simple_counter/`

### What’s in this folder
- **`simple_counter.v`**  
  A minimal “up‐only” counter:  
  - Fixed bit‐width (e.g., 4-bit or 8-bit)  
  - No direction input (hard-coded to count upward)  
  - Single enable input (`en`)  
  - Synchronous reset (`rst_n`)  
- **`simple_counter_tb.v`** (testbench)  
  Quickly verifies that when `en = 1`, the counter increments on each rising clock edge; when `rst_n = 0`, it returns to 0.  

### What it does
- Strips down the full `counter/` logic to its bare minimum in order to test:  
  1. Basic clock-driven increment  
  2. Reset behavior  

### Key accomplishments
- Confirms that the target FPGA’s clock routing and simple register synthesis work as expected  
- Outputs a clean, single‐bit enable + counter interface that is easy to integrate with display logic  

### How it contributes to the bigger project/game
- Provides the **simplest building block** for driving a 7-segment display: each tick = next digit  
- Allows us to attach a seven-segment decoder (in `seven_seg/`) and verify that “0000 → 0001 → … → 1111 → 0000” appears as expected  
- Serves as the first step toward timing out how often new RNG values should be shown

---

## 3. `unique_selector_counter/`

### What’s in this folder
- **`unique_selector.v`** (or `unique_selector_counter.v`)  
  Implements a “unique number selector” based on a seed and a mask/array:  
  - Takes in a single seed input (`seed[N-1:0]`, typically 4-bits for 0…15)  
  - Generates a pseudo-random index each clock cycle (using a simple LFSR or combinational RNG)  
  - Maintains a small on-chip register or BRAM to track which numbers have already been “selected”  
  - Once all numbers in [0..M-1] have been output exactly once, asserts `all_selected` and optionally resets this tracking memory  
- **`unique_selector_tb.v`** (testbench)  
  - Drives `seed` through a small sequence of values (e.g., 0…7)  
  - Verifies that each index from 0…7 appears exactly once before `all_selected` goes high  
  - Shows how to “wrap around” and re-seed if needed  

### What it does
- Demonstrates how to pick a sequence of **N distinct numbers** (0…N-1) in “randomized” order without repetition  
- Tracks which numbers remain and resets automatically when the set is exhausted  

### Key accomplishments
- Validates a hardware approach to ensuring “no duplicates until the full set is used”  
- Provides the `all_selected` handshake signal, which downstream logic (e.g., a game controller) can use to know “this round is done; bump the seed and start a new round”  

### How it contributes to the bigger project/game
- Implements the **core RNG logic** needed to drive features like:  
  1. Displaying 8 unique dice rolls (0…7) on a bunch of 7-segment displays  
  2. Generating a shuffled sequence of “cards” or “lucky draws” in a game  
- Supplies a seed-update mechanism (seed += 1 each time `all_selected` is asserted), guaranteeing that the same sequence never appears twice in a row  
- Combined with the 7-segment decoder (in `seven_seg/`) and timing (from `simple_counter/`), forms the heart of the “RNG 7-segment demo”  

---

## How These Experiments Fit Together

1. **`counter/`** ➔ Establishes a **full-feature** up/down counter block  
2. **`simple_counter/`** ➔ Boils that down to the **essentials** (up-only, single enable) so we can quickly verify integration with a display  
3. **`unique_selector_counter/`** ➔ Builds on the counting/timing ideas from steps 1–2 and layers in a simple RNG + tracking array to guarantee no duplicates  
4. **Bigger Project Integration**  
   - Once `unique_selector_counter/` is stable, you can hook its output indices into a `seven_seg/` decoder.  
   - Use `simple_counter/` (or a derived timing block) to drive how often you read a new RNG index.  
   - Add a top-level module to tie together clock, reset, seed, “all_selected → seed++,” and feed the resulting index to the 7-segment driver.  
   - The final “RNG 7-segment demo” sits in a separate folder (e.g., `rng_7seg_demo/`), importing the stable `.v` files from these three experiments.

---

## How to Run Each Experiment

> **Prerequisites:**  
> - An FPGA synthesis tool (e.g., Vivado, Quartus, or your university’s FDE suite).  
> - A simulator (e.g., ModelSim, QuestaSim, or iverilog + GTKWave).  
> - Basic familiarity with `.v` files and how to run a testbench.

1. **Open the subfolder** (e.g., in a terminal or your IDE).  
2. **Simulate the Testbench**  
   - Launch your simulator, pointing to `*.v` and `*_tb.v` in that folder.  
   - Confirm all assertions pass (i.e., no `“ERROR: Unexpected value”` or `“FAIL”` messages).  
3. **Synthesize & Implement (Optional)**  
   - Create a new project with your synthesis tool.  
   - Include only the `.v` files in this folder.  
   - Run “Synthesis → Implementation → Bitstream” to produce a `.bit` or `.bin`.  
   - (You can then load it onto your FPGA board to visually verify LEDs or connect to the 7-segment fixture.)

---

## Guidelines for Extending or Integrating

- **Naming Conventions:**  
  Keep module names consistent. If you rename a top‐level entity, update its testbench accordingly.  
- **Code Reuse:**  
  When you move to the “full demo” folder, reference these modules by path (e.g., `../simple_counter/simple_counter.v`). Do not copy/paste—this ensures a single source of truth.  
- **Version Control:**  
  Each experiment folder may get updated as you refine timing or optimize resources. Tag or branch when you reach a stable milestone (e.g., `counter_v1.0`, `unique_selector_v2.1`).  
- **Documentation:**  
  If you modify or optimize the logic (e.g., change the RNG algorithm inside `unique_selector/`), update that folder’s own `README.md` first, then reflect any relevant changes here in the top‐level `experiments/README.md`.

---

## Related Resources

- **Seven-Segment Decoder** → See `../seven_seg/` for how to convert a 4-bit index into the seven segment bitmask.  
- **Top-Level Demo** → Once each submodule is validated, the “RNG 7-Segment Demo” folder demonstrates how to tie them all together.  
- **Documentation** → For in-depth details on timing constraints and resource utilization, consult the project’s main wiki or `docs/` folder.

---

> **Tip:** Whenever you add a new experiment (e.g., a “debounce button” or “frame‐buffer interface”),  
> 1. Create a new subdirectory under `experiments/`.  
> 2. Copy this template into its `README.md` and fill in the sections:  
>    - What’s in this folder  
>    - What it does  
>    - Key accomplishments  
>    - How it contributes to the bigger project  
> 3. Add a line for the new folder in the top-level `Directory Structure` above.

---

_By following this template, you’ll keep all mini-experiments well documented, making it easy for anyone on the team to understand how every piece fits into the final FPGA-based game/project._
