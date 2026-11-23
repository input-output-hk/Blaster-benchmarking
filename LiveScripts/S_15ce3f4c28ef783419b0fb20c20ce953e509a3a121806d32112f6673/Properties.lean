import LiveScripts.Shared
import LiveScripts.S_15ce3f4c28ef783419b0fb20c20ce953e509a3a121806d32112f6673.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_15ce3f4c28ef783419b0fb20c20ce953e509a3a121806d32112f6673.script [ctx] 10000]
