import LiveScripts.Shared
import LiveScripts.S_ee4fa741e63c4965d2b2165bcf113e0249e0f8b9a49d6e5c16c75764.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ee4fa741e63c4965d2b2165bcf113e0249e0f8b9a49d6e5c16c75764.script [ctx] 10000]
