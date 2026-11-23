import LiveScripts.Shared
import LiveScripts.S_c1d0087c61e3a8f18501c5aa47051772fdc3d5325b98d3b0f8678619.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c1d0087c61e3a8f18501c5aa47051772fdc3d5325b98d3b0f8678619.script [datum, redeemer, ctx] 10000]
