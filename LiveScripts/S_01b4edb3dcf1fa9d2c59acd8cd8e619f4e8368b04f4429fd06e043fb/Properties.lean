import LiveScripts.Shared
import LiveScripts.S_01b4edb3dcf1fa9d2c59acd8cd8e619f4e8368b04f4429fd06e043fb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_01b4edb3dcf1fa9d2c59acd8cd8e619f4e8368b04f4429fd06e043fb.script [redeemer, ctx] 10000]
