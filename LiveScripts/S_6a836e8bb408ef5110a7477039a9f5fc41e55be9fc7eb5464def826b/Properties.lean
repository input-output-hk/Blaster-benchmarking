import LiveScripts.Shared
import LiveScripts.S_6a836e8bb408ef5110a7477039a9f5fc41e55be9fc7eb5464def826b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6a836e8bb408ef5110a7477039a9f5fc41e55be9fc7eb5464def826b.script [datum, redeemer, ctx] 10000]
