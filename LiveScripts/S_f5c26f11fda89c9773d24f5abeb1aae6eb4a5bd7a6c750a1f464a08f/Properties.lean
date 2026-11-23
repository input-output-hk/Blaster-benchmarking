import LiveScripts.Shared
import LiveScripts.S_f5c26f11fda89c9773d24f5abeb1aae6eb4a5bd7a6c750a1f464a08f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f5c26f11fda89c9773d24f5abeb1aae6eb4a5bd7a6c750a1f464a08f.script [ctx] 10000]
