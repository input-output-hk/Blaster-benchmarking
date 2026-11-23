import LiveScripts.Shared
import LiveScripts.S_5ff54dd03373636ecc9930a87dfe100edbba4d5a81b789aad54315ef.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5ff54dd03373636ecc9930a87dfe100edbba4d5a81b789aad54315ef.script [redeemer, ctx] 10000]
