import LiveScripts.Shared
import LiveScripts.S_95bce8a995d0c68d954bf5e876d4eb0ae2629a70cf8afe9fe5a3ec04.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_95bce8a995d0c68d954bf5e876d4eb0ae2629a70cf8afe9fe5a3ec04.script [ctx] 10000]
