import LiveScripts.Shared
import LiveScripts.S_258121d10ada7e00bb9182886a09c00209a5796a225fcca1660df042.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_258121d10ada7e00bb9182886a09c00209a5796a225fcca1660df042.script [ctx] 10000]
