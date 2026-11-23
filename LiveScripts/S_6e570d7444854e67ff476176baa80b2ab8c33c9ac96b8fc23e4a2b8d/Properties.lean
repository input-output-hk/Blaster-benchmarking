import LiveScripts.Shared
import LiveScripts.S_6e570d7444854e67ff476176baa80b2ab8c33c9ac96b8fc23e4a2b8d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6e570d7444854e67ff476176baa80b2ab8c33c9ac96b8fc23e4a2b8d.script [ctx] 10000]
