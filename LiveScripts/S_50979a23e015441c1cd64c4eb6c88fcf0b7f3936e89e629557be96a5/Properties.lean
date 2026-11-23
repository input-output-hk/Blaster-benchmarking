import LiveScripts.Shared
import LiveScripts.S_50979a23e015441c1cd64c4eb6c88fcf0b7f3936e89e629557be96a5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_50979a23e015441c1cd64c4eb6c88fcf0b7f3936e89e629557be96a5.script [ctx] 10000]
