import LiveScripts.Shared
import LiveScripts.S_cb00bcdee59c8d1ff08c0cb0b75d1e47d3139122df79c14addd72ce3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cb00bcdee59c8d1ff08c0cb0b75d1e47d3139122df79c14addd72ce3.script [ctx] 10000]
