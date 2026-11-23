import LiveScripts.Shared
import LiveScripts.S_dcfd60b4684c03fb4b08b14a0506b03b0d22f9aba943e9101348ff5a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dcfd60b4684c03fb4b08b14a0506b03b0d22f9aba943e9101348ff5a.script [ctx] 10000]
