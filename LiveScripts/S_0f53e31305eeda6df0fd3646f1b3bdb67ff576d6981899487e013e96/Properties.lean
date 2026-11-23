import LiveScripts.Shared
import LiveScripts.S_0f53e31305eeda6df0fd3646f1b3bdb67ff576d6981899487e013e96.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0f53e31305eeda6df0fd3646f1b3bdb67ff576d6981899487e013e96.script [ctx] 10000]
