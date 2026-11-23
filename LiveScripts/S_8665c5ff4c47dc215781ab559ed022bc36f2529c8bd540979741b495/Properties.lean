import LiveScripts.Shared
import LiveScripts.S_8665c5ff4c47dc215781ab559ed022bc36f2529c8bd540979741b495.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8665c5ff4c47dc215781ab559ed022bc36f2529c8bd540979741b495.script [ctx] 10000]
