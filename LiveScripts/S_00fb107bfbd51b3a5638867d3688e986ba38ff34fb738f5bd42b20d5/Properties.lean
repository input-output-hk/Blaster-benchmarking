import LiveScripts.Shared
import LiveScripts.S_00fb107bfbd51b3a5638867d3688e986ba38ff34fb738f5bd42b20d5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_00fb107bfbd51b3a5638867d3688e986ba38ff34fb738f5bd42b20d5.script [datum, redeemer, ctx] 10000]
