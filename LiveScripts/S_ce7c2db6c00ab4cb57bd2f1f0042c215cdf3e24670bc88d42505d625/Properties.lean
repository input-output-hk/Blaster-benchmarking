import LiveScripts.Shared
import LiveScripts.S_ce7c2db6c00ab4cb57bd2f1f0042c215cdf3e24670bc88d42505d625.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ce7c2db6c00ab4cb57bd2f1f0042c215cdf3e24670bc88d42505d625.script [ctx] 10000]
