import LiveScripts.Shared
import LiveScripts.S_e01f8d80fd3cfeefe170731ef0bf1455a5d15f0e457342fa96a64880.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e01f8d80fd3cfeefe170731ef0bf1455a5d15f0e457342fa96a64880.script [ctx] 10000]
