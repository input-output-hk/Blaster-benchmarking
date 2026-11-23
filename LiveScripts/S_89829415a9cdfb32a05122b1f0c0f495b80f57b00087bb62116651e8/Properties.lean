import LiveScripts.Shared
import LiveScripts.S_89829415a9cdfb32a05122b1f0c0f495b80f57b00087bb62116651e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_89829415a9cdfb32a05122b1f0c0f495b80f57b00087bb62116651e8.script [datum, redeemer, ctx] 10000]
