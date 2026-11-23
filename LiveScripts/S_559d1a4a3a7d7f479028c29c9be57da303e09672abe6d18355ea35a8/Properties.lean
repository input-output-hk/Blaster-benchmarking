import LiveScripts.Shared
import LiveScripts.S_559d1a4a3a7d7f479028c29c9be57da303e09672abe6d18355ea35a8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_559d1a4a3a7d7f479028c29c9be57da303e09672abe6d18355ea35a8.script [ctx] 10000]
