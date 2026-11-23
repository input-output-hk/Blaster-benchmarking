import LiveScripts.Shared
import LiveScripts.S_0fe20512f155e79766bd5ab74151a48c97fadc13166853c164f58285.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0fe20512f155e79766bd5ab74151a48c97fadc13166853c164f58285.script [ctx] 10000]
