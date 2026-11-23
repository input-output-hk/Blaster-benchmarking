import LiveScripts.Shared
import LiveScripts.S_f1edf8ccfa0a215698475190f97dfb4a65c68a5bf166fa81db4d4aa6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f1edf8ccfa0a215698475190f97dfb4a65c68a5bf166fa81db4d4aa6.script [ctx] 10000]
