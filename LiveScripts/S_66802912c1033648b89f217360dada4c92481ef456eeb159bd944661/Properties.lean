import LiveScripts.Shared
import LiveScripts.S_66802912c1033648b89f217360dada4c92481ef456eeb159bd944661.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_66802912c1033648b89f217360dada4c92481ef456eeb159bd944661.script [ctx] 10000]
